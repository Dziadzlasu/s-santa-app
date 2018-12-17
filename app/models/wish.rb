class Wish < ApplicationRecord
  belongs_to :user

  validates_presence_of :description

  scope :pending, -> { where(status: 'pending') }
  scope :fulfilled, -> { where(status: 'completed') }
  scope :expired, -> { where(status: 'expired') }
end
