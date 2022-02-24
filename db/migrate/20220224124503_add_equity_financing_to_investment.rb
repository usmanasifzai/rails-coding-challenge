class AddEquityFinancingToInvestment < ActiveRecord::Migration[6.1]
  def change
    add_reference :investments, :equity_financing, index: true , foreign_key: true
  end
end
