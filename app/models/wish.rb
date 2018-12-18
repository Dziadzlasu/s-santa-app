class Wish < ApplicationRecord
  belongs_to :user

  validates_presence_of :description
  validate :one_wish

  scope :pending, -> { where(status: 'pending') }
  scope :fulfilled, -> { where(status: 'completed') }
  scope :expired, -> { where(status: 'expired') }

  def one_wish
    return unless Wish.where(user_id: self.user_id, status: 'pending').exists?

    errors.add(:base, :second_pending)
  end
end
