class CreateAdvertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.string :book_title
      t.string :book_author
      t.string :book_publication
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
