require 'rails_helper'

RSpec.describe "bookings/show", type: :view do
  let(:booking) { create(:booking, status: "Status", tickets_count: 2) }

  before(:each) do
    assign(:booking, booking)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{booking.user_id}/)
    expect(rendered).to match(/#{booking.event_id}/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
  end
end
