require 'rails_helper'

RSpec.describe "bookings/new", type: :view do
  let(:booking) { build(:booking) }

  before(:each) do
    assign(:booking, booking)
  end

  it "renders new booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do
      assert_select "input[name=?]", "booking[user_id]"
      assert_select "input[name=?]", "booking[event_id]"
      assert_select "input[name=?]", "booking[status]"
      assert_select "input[name=?]", "booking[tickets_count]"
    end
  end
end
