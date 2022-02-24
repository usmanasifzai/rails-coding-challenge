# frozen_string_literal: true

class EquityFinancing < ApplicationRecord
    belongs_to :company
    has_many :investments , dependent: :destroy
    
    validates :date, presence: true
    validates :total_shares, numericality: { greater_than_or_equal_to: 0 } 
end
