class AddTradeToOffer < ActiveRecord::Migration[5.2]
  def change
    add_reference :offers, :trade, foreign_key: true
  end
end
