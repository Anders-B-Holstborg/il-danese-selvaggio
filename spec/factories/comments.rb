# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    article

    sequence(:content) { |n| "Brilliant comment number #{n}" }
  end
end
