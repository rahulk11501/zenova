require 'rails_helper'

RSpec.describe "events/index", type: :view do
  let!(:events) { create_list(:event, 2, title: "Title", description: "MyText", location: "Location", capacity: 2, price: 9.99) }

  before(:each) do
    assign(:events, events)
  end

  it "renders a list of events" do
    render

    events.each do |event|
      expect(rendered).to match(/#{event.title}/)
      expect(rendered).to match(/#{event.description}/)
      expect(rendered).to match(/#{event.location}/)
      expect(rendered).to match(/#{event.capacity}/)
      expect(rendered).to match(/#{event.price}/)
    end
  end
end
