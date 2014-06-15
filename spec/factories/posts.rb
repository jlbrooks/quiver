# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :post do
    title "Test Post"
    body "My extremely profound thoughts on various matters"
  end

  factory :invalid_post, parent: :post do
    title nil
  end
end
