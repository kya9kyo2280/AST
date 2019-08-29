# frozen_string_literal: true

FactoryBot.define do
  password = Faker::Internet.password

  factory :user do
    sequence(:email) { |n| "example#{n}@test.com" }
    sequence(:name) { |n| "name#{n}" }
    password { password }
    password_confirmation { password }

    trait :no_name do
      name {}
    end


    trait :too_short_name do
      name {Faker::Lorem.characters(number: 1)}
    end

    trait :create_with_image do
      profile_image {Refile::FileDouble.new("dummy", "logo.png", content_type: "image/png")}
    end

  end
end
