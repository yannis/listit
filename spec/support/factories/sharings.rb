# frozen_string_literal: true

FactoryBot.define do
  factory :sharing do
    list
    sharer { |sharing| sharing.list.user }
    association :recipient, factory: :user
    accepted { true }
    trait :declined do
      accepted { false }
    end
  end
end
