class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlist_items, dependent: :delete_all
end
