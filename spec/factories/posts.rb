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

  factory :long_post, parent: :post do
    title "Long Post"
    body "A test or examination is an assessment intended to measure a test-taker's knowledge, skill, aptitude, 
          physical fitness, or classification in many other topics (e.g., beliefs). A test may be administered 
          orally, on paper, on a computer, or in a confined area that requires a test taker to physically perform a 
          set of skills. Tests vary in style, rigor and requirements. For example, in a closed book test, a test taker 
          is often required to rely upon memory to respond to specific items whereas in an open book test, a test taker 
          may use one or more supplementary tools such as a reference book or calculator when responding to an item. 
          A test may be administered formally or informally. An example of an informal test would be a reading test 
          administered by a parent to a child. An example of a formal test would be a final examination administered 
          by a teacher in a classroom or an I.Q. test administered by a psychologist in a clinic. Formal testing often 
          results in a grade or a test score.[1] A test score may be interpreted with regards to a norm or criterion, 
          or occasionally both. The norm may be established independently, or by statistical analysis of a large number 
          of participants FOOBAR"
  end
end
