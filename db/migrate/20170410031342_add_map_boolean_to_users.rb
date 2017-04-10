class AddMapBooleanToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :maps, :boolean, default: :false
  end
end
