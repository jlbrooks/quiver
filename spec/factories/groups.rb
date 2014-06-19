# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :group do
    name  "test name"
    description  "test description"
  end
end
