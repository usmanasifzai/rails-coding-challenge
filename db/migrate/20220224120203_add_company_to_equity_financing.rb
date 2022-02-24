class AddCompanyToEquityFinancing < ActiveRecord::Migration[6.1]
  def change
    add_reference :equity_financings, :company, index: true , foreign_key: true
  end
end
