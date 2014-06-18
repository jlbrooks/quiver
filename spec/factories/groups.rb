# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :group do
    name "test name"
    has_many_members 5
    description "test description"
    user = "test@one.com"
  end
end
