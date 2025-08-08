require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  let(:event) { create(:event, title: "MyString", description: "MyText", location: "MyString", capacity: 1, price: 9.99) }

  before(:each) do
    assign(:event, event)
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(event), "post" do
      assert_select "input[name=?]", "event[title]"
      assert_select "textarea[name=?]", "event[description]"
      assert_select "input[name=?]", "event[location]"
      assert_select "input[name=?]", "event[capacity]"
      assert_select "input[name=?]", "event[price]"
    end
  end
end
