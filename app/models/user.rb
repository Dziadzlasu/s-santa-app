class User < ApplicationRecord
  validates_presence_of :email, :first_name, :last_name

  has_many :wishes

  def full_name
    "#{first_name} #{last_name}"
  end
end
