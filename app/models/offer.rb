class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :advertisement

  enum status: [:pending, :accepted, :declined]
end
