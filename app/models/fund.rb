# frozen_string_literal: true

class Fund < ApplicationRecord
    has_many :investments,dependent: :destroy
    validates :name, uniqueness: true
end
