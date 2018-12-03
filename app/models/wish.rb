class Wish < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :description

  scope :pending, -> { where(status: 'pending') }
  scope :realised, -> { where(status: 'completed') }
end
