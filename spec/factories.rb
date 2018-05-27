# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email "test@example.pl"
    password "password"
    password_confirmation "password"
  end
end
