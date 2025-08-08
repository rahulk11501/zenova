require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  let!(:bookings) { create_list(:booking, 2, status: "Status", tickets_count: 2) }

  before(:each) do
    assign(:bookings, bookings)
  end

  xit "renders a list of bookings" do
    render

    bookings.each do |booking|
      # Check that the rendered page contains the user name
      expect(rendered).to match(/#{booking.user.name}/)

      # Check that the rendered page contains the event title
      expect(rendered).to match(/#{booking.event.title}/)

      # Check status and tickets count
      expect(rendered).to match(/Status/)
      expect(rendered).to match(/2/)
    end
  end
end
