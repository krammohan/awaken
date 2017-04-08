class CreateWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :widgets do |t|
      t.references :user, foreign_key: true, null: false
      t.references :calendar, foreign_key: true

      t.timestamps
    end
  end
end
