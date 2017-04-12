class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :serial
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
