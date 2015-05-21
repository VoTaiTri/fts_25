FactoryGirl.define do
  factory :question do
    subject
    description "What is mysql?"
    
    factory :question_with_options do
      after :create do |question|
        4.times do
          create :option, question: question
        end
      end
    end

    factory :question_with_one_answer_sheet do
      after :create do |question|        
        create :answer_sheet, question: question        
      end
    end

    factory :question_with_4_answer_sheets do
      after :create do |question|
        4.times do
          create :answer_sheet, question: question
        end
      end
    end
  end
end
