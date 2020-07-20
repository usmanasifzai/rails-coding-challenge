# frozen_string_literal: true

FactoryBot.define do
  factory :fund do
    name { "#{Faker::Company.buzzword.titleize} Ventures" }
  end
end
