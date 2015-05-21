FactoryGirl.define do
  factory :examination do    
    subject
    user

    factory :examination_with_one_answer_sheet do
      after :create do |examination|        
        create :answer_sheet, examination: examination        
      end
    end

    factory :examination_with_4_answer_sheets do
      after :create do |examination|
        4.times do
          create :answer_sheet, examination: examination
        end
      end
    end
  end
end
