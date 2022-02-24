class AddFundToInvestment < ActiveRecord::Migration[6.1]
  def change
    add_reference :investments, :fund, index: true , foreign_key: true
  end
end
