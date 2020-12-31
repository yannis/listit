# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    list
    name { FFaker::Lorem.word }

    trait :crossed do
      crossed_at { Time.current }
    end
  end
end
