class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :name, null: false, index: true
      t.references :user, null: false, foreign_key: true
      t.timestamp :last_used_at

      t.timestamps
    end
  end
end
