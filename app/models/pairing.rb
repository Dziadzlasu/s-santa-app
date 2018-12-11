class Pairing < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :giver, class_name: 'User'
end
