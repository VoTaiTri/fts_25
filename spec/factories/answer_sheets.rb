FactoryGirl.define do
  factory :answer_sheet do
    examination
    question
    option
    answer_content "My Answer"
    correct false    
  end
end
