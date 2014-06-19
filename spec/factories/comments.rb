# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :comment do
    body "My profound thoughts on your profound thoughts on various matters	"
    factory :post do
    title "Test Post"
    body "My extremely profound thoughts on various matters"
end

end
end
