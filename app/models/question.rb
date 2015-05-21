class Question < ActiveRecord::Base
  belongs_to :subject
  has_many :answer_sheets
  has_many :options, dependent: :destroy, inverse_of: :question
  
  accepts_nested_attributes_for :options, allow_destroy: true
  
  validates_presence_of :subject, :description
  
  def correct_option
    options.find_by_correct true
  end
end
