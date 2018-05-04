class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :book_title
      t.string :book_author
      t.string :book_publication
      t.text :comment
      t.references :user, foreign_key: true
      t.references :advertisement, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
