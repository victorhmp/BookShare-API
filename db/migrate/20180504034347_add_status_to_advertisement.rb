class AddStatusToAdvertisement < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisements, :status, :integer
  end
end
