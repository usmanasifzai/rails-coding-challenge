# frozen_string_literal: true

FactoryBot.define do
  factory :investment do
    fund
    equity_financing
    amount { rand(0...1_000_000) }
    shares { rand(0...1_000_000) }
  end
end
