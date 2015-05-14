class AnswerSheet < ActiveRecord::Base
  belongs_to :question
  belongs_to :option
  belongs_to :examination
  
  scope :corrects, -> {where correct: true}
end
