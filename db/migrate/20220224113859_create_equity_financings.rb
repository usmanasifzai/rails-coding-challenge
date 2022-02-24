# frozen_string_literal: true

class CreateEquityFinancings < ActiveRecord::Migration[6.1]
  def change
    create_table :equity_financings do |t|
      t.date :date, null: false
      t.bigint :total_shares, null: false, default: 0
      t.timestamps
    end
  end
end
