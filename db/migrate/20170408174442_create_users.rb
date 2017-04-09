class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :username
      t.string :provider
      t.string :access_token
      t.string :refresh_token
      t.time :time

      t.timestamps
    end
  end
end
