class AddLocationToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :origin_location, :string
  	add_column :users, :destination_location, :string
  	add_column :users, :mode, :string
  	add_column :users, :transit_mode, :string
  end
end

