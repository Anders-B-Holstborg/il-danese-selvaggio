# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Gabe' }
    last_name { 'Newell' }
    nick_name { 'Gaben' }
    email { 'release.half_life_3@valve.com' }
    password { 'vortigauntSw33per' }
  end
end
