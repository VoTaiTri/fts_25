User.create! username:  "Rathanak Jame",
             email: "sreangrathanak@gmail.com",
             password:              "1234567890",
             password_confirmation: "1234567890",
             admin: true

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "1234567890"
  User.create! username:  name,
               email: email,
               password:              password,
               password_confirmation: password
end

5.times do
  name = Faker::Name.name
  duration = 40
  Subject.create! name: name, duration: duration
end

subjects = Subject.all
subjects.each do |subject|
  10.times do
    question = subject.questions.create! description: Faker::Lorem.sentence 
    4.times do |n|
      option_des = Faker::Lorem.sentence 
      question.options.create! description: option_des,correct: 3 == n 
    end
  end
  3.times do
    question = subject.questions.create! description: Faker::Lorem.sentence
  end  
end

users = User.limit 20
users.each do |user|
  subjects.limit(3).each do |subject|
    exam = user.examinations.create! subject_id: subject.id    
    subject.questions.each do |question|
      exam.answer_sheets.create question_id: question.id  
    end
  end
end


