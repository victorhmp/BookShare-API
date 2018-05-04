class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :advertisement
  has_one :trade

  enum status: [:pending, :accepted, :declined]
end
