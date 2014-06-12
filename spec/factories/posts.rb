# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :post do
    title "Test Post"
    body "My extremely profound thoughts on various matters"
  end
end
