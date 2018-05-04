class AddTradeToAdvertisement < ActiveRecord::Migration[5.2]
  def change
    add_reference :advertisements, :trade, foreign_key: true
  end
end
