FactoryGirl.define do
  factory :option do
    question
    description "Ruby on Rails is Framework which build using Ruby"

    factory :option_with_one_answer_sheet do
      after :create do |option|        
        create :answer_sheet, option: option        
      end
    end

    factory :option_with_4_answer_sheets do
      after :create do |option|
        4.times do
          create :answer_sheet, option: option
        end
      end
    end
  end
end
