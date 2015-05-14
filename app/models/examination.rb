class Examination < ActiveRecord::Base  
  after_create  :create_answer_sheets  
  
  belongs_to :user
  belongs_to :subject
  has_many :answer_sheets, dependent: :destroy  
  
  accepts_nested_attributes_for :answer_sheets, allow_destroy: true
  
  scope :finishes, -> {where status: "Finished"}
  
  def total_scores
    answer_sheets.corrects.count
  end
  
  def total_questions
    subject.questions.count
  end
  
  private
  def create_answer_sheets
    subject.questions.order("RAND(id)").limit(20).each do |question|
      answer_sheets.create question_id: question.id
    end
  end
end
