class AnswerSheet < ActiveRecord::Base
  before_create :add_answer_sheet_status
  after_create  :create_answers
  
  belongs_to :examination
  belongs_to :subject
  has_many :answers, dependent: :destroy
   
  private
  def add_answer_sheet_status
    if self.status.blank?
      self.status = "Start"
    end
  end
  
  def create_answers
    examination.subject.questions.each do |question|
      answers.create question_id: question.id
    end
  end
end
