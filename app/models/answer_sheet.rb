class AnswerSheet < ActiveRecord::Base
  belongs_to :question
  belongs_to :option
  belongs_to :examination
  
  validates :examination, :question, presence: true

  scope :corrects, -> {where correct: true}
end
