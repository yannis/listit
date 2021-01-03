# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    confirmed_at { Time.current }
    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
