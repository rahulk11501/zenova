class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
