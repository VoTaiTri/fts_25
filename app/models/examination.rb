class Examination < ActiveRecord::Base
  before_save :correct_questions_have_options, if: :start_correction
  after_create  :create_answer_sheets
  
  attr_accessor :start_correction
  
  belongs_to :user
  belongs_to :subject
  has_many :answer_sheets, dependent: :destroy  
  has_many :questions, through: :answer_sheets
  
  validates :user, :subject, presence: true
  accepts_nested_attributes_for :answer_sheets, allow_destroy: true
  
  scope :have_status, ->(status) {where status: status}
  
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
  
  def correct_questions_have_options
    answer_sheets.each do |answer_sheet|
      options = answer_sheet.question.options
      if options.any?
        if answer_sheet.option_id.nil?
          answer_sheet.correct = false
        else
          result = options.find_by_id answer_sheet.option_id
          answer_sheet.correct = result.correct
        end
      end
    end
  end
end
