class Subject < ActiveRecord::Base
  has_many :answer_sheets, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers
  
  validates_presence_of :name, :duration
  validates_numericality_of :duration
end
