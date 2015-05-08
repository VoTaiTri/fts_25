class Subject < ActiveRecord::Base
  has_many :answer_sheets, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers
end
