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
end

users = User.all
users.each do |user|
  exam = user.examinations.create!
  
  num = Random.rand(1...5)
  num.times do |n|
    answer_sheet = exam.answer_sheets.create! status: "start", subject_id: n+1
    answer_sheet.subject.questions.each do |question|
      answer_sheet.answers.create question_id: question.id, option_id: Random.rand(1...4)
    end    
  end
end
