FactoryGirl.define do
  factory :subject do
    name "MySql"
    duration 40

    factory :subject_with_one_question do
      after :create do |subject|
        create :question, subject: subject
      end
    end

    factory :subject_with_10_questions do
      after :create do |subject|
        10.times do
          create :question, subject: subject
        end
      end
    end

    factory :subject_with_one_examinations do
      after :create do |subject|
        create :examination, subject: subject
      end
    end

    factory :subject_with_4_examinations do
      after :create do |subject|
        4.times do
          create :examination, subject: subject
        end
      end
    end
  end
end
