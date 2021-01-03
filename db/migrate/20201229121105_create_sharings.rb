# frozen_string_literal: true

class CreateSharings < ActiveRecord::Migration[6.1]
  def change
    create_table :sharings do |t|
      t.references :sharer, null: false, foreign_key: { to_table: :users }
      t.references :recipient, null: false, foreign_key: { to_table: :users }
      t.references :list, null: false, foreign_key: true
      t.timestamp :status_at, null: true
      t.boolean :accepted, default: false

      t.timestamps
    end

    add_index :sharings, [:recipient, :list_id, :accepted], unique: true
  end
end
