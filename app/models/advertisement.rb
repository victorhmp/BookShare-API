class Advertisement < ApplicationRecord
  belongs_to :user
  has_one: trade

  enum status: [:open, :closed] # open/closed to offers
end
