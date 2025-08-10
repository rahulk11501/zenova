class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :authorize_booking!, only: %i[show edit update destroy]

  # GET /bookings
  def index
    @bookings = current_user.bookings.includes(:event)
  end

  # GET /bookings/1
  def show
  end

  # GET /bookings/new
  def new
    @event = Event.find(params[:event_id]) if params[:event_id].present?
    @booking = current_user.bookings.new(event: @event)
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    @booking = current_user.bookings.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy!
    respond_to do |format|
      format.html { redirect_to bookings_path, status: :see_other, notice: "Booking was successfully canceled." }
      format.json { head :no_content }
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def authorize_booking!
    redirect_to bookings_path, alert: "Not authorized." unless @booking.user == current_user
  end

  def booking_params
    params.require(:booking).permit(:event_id, :status, :tickets_count)
  end
end
