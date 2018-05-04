class Advertisement < ApplicationRecord
  belongs_to :user

  enum status: [:open, :closed] # open/closed to offers
end
