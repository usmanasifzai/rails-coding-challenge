class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.bigint :shares, null: false, default: 0
      t.decimal :amount, precision: 10, scale: 2, null: false, default: 0
      t.timestamps
    end
  end
end
