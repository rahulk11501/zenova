require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with valid attributes" do
    event = build(:event)
    expect(event).to be_valid
  end

  it "is invalid without a title" do
    event = build(:event, title: nil)
    expect(event).not_to be_valid
  end
end
