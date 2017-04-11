class AddContentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :content, :text, default: "<div></div>"
  end
end
