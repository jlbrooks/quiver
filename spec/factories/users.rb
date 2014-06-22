# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "foo@bar.com"
    password "password"
    first_name "Jacob"
    last_name "Brooks"
  end
end
