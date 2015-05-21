FactoryGirl.define do
  factory :user do
    sequence(:username) {|i| "Rathanak#{i}" }
    sequence(:email) {|i| "sreangrathanak#{i}@gmail.com"}
    password "1234567890"
    password_confirmation "1234567890"
    role 0

    factory :user_with_one_examination do
      after :create do |user|
        create :examination, user: user 
      end
    end
    
    factory :user_with_4_examinations do
      after :create do |user|
        4.times do
          create :examination, user: user
        end
      end
    end
  end
end
