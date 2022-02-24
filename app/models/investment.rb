class Investment < ApplicationRecord
    belongs_to :fund
    belongs_to :equity_financing
    validates :shares, numericality: { greater_than: 0 }
    validates :amount, numericality: { greater_than: 0 }
end
