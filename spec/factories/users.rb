# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email
    password { '12345678' }
    password_confirmation { '12345678' }
    confirmed_at { Date.today }
  end

  factory :user_with_name, class: "User" do
    email
    password { '12345678' }
    password_confirmation { '12345678' }
    first_name { 'MyFirstName' }
    last_name { 'MyLastName' }
    confirmed_at { Date.today }
  end
end