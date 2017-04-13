class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :username
      t.string :provider
      t.string :access_token
      t.string :refresh_token
      t.time   :time
      t.boolean :weather, default: :false
      t.string :zip
<<<<<<< HEAD
      t.string :channel
=======
      t.boolean :calendar, default:false
>>>>>>> 5a7993e653c9c2300465fb302554e2ede92bf325

      t.timestamps
    end
  end
end
