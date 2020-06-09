# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password { Faker::Internet.password }

    trait :student do
      mentor { false }
      email { Faker::Internet.email(domain: 'fe.up.pt') }
    end

    trait :mentor do
      mentor { true }
      email { Faker::Internet.email }
    end
  end
end
