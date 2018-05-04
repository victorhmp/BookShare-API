class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.integer :status
      t.references :advertisement, foreign_key: true
      t.references :offer, foreign_key: true

      t.timestamps
    end
  end
end
