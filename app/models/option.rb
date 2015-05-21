class Option < ActiveRecord::Base
  belongs_to :question, inverse_of: :options
  has_many :answer_sheets
  
  validates_presence_of :question, :description
end
