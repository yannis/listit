# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { "MyString" }
    crossed_at { "2020-12-26 16:32:44" }
    list { nil }
  end
end
