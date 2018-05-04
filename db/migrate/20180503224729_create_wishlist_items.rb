class CreateWishlistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlist_items do |t|
      t.string :book_title
      t.string :book_author
      t.string :book_publication
      t.references :wishlist, foreign_key: true

      t.timestamps
    end
  end
end
