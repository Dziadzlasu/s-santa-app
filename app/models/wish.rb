class Wish < ApplicationRecord
  belongs_to :user, optional: true # optional is temporary, until devise is set up

  validates_presence_of :description

  scope :pending, -> { where(status: 'pending') }
  scope :fulfilled, -> { where(status: 'completed') }
end
