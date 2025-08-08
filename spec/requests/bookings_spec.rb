require 'rails_helper'

RSpec.describe "/bookings", type: :request do
  let(:user) { create(:user) }
  let(:event) { create(:event) }

  let(:valid_attributes) do
    attributes_for(:booking, user_id: user.id, event_id: event.id)
  end

  let(:invalid_attributes) do
    {
      user_id: nil,
      event_id: nil,
      tickets_count: nil,
      status: nil
    }
  end

  let(:new_attributes) do
    { tickets_count: 4, status: 'pending' }
  end

  describe "GET /index" do
    it "renders a successful response" do
      create(:booking, user: user, event: event)
      get bookings_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      booking = create(:booking, user: user, event: event)
      get booking_url(booking)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_booking_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      booking = create(:booking, user: user, event: event)
      get edit_booking_url(booking)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Booking" do
        expect {
          post bookings_url, params: { booking: valid_attributes }
        }.to change(Booking, :count).by(1)
      end

      it "redirects to the created booking" do
        post bookings_url, params: { booking: valid_attributes }
        expect(response).to redirect_to(booking_url(Booking.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Booking" do
        expect {
          post bookings_url, params: { booking: invalid_attributes }
        }.not_to change(Booking, :count)
      end

      it "renders a response with 422 status" do
        post bookings_url, params: { booking: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested booking" do
        booking = create(:booking, user: user, event: event)
        patch booking_url(booking), params: { booking: new_attributes }
        booking.reload
        expect(booking.tickets_count).to eq(4)
        expect(booking.status).to eq('pending')
      end

      it "redirects to the booking" do
        booking = create(:booking, user: user, event: event)
        patch booking_url(booking), params: { booking: new_attributes }
        booking.reload
        expect(response).to redirect_to(booking_url(booking))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        booking = create(:booking, user: user, event: event)
        patch booking_url(booking), params: { booking: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested booking" do
      booking = create(:booking, user: user, event: event)
      expect {
        delete booking_url(booking)
      }.to change(Booking, :count).by(-1)
    end

    it "redirects to the bookings list" do
      booking = create(:booking, user: user, event: event)
      delete booking_url(booking)
      expect(response).to redirect_to(bookings_url)
    end
  end
end
