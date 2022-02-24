# frozen_string_literal: true

class CreateFunds < ActiveRecord::Migration[6.1]
  def change
    create_table :funds do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :funds, :name, unique: true
  end
end
