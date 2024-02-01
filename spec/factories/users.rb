# spec/factories/users.rb

FactoryBot.define do
    factory :user do
      username { 'test_user' }
      password_digest { 'password' }
    end
  end
  