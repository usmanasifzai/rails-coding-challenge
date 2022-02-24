# frozen_string_literal: true

class Company < ApplicationRecord
    has_many :equity_financings, dependent: :destroy
    
    validates :name, uniqueness: { case_sensitive: true }
    validates :founded, presence: true 
end
