class AddNewsBooleanToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :news, :boolean, default: :true
  end
end