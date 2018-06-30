class Advertisement < ApplicationRecord
  belongs_to :user
  has_one :trade
  has_many :offer

  enum status: [:open, :closed] # open/closed to offers
end
