require 'rails_helper'

RSpec.describe "events/show", type: :view do
  let(:event) { create(:event, title: "Title", description: "MyText", location: "Location", capacity: 2, price: 9.99) }

  before(:each) do
    assign(:event, event)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
  end
end
