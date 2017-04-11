class AddTransitToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :transit, :boolean, default: false
  end
end
