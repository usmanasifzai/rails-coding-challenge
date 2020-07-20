# frozen_string_literal: true

FactoryBot.define do
  factory :equity_financing do
    company
    date { Date.today }
    total_shares { rand(0...1_000_000) }
  end
end
