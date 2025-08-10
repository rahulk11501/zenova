class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :tickets_count, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: %w[pending confirmed canceled] }
end
