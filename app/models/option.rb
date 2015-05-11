class Option < ActiveRecord::Base
  belongs_to :question, inverse_of: :options
  has_many :answers
  
  validates_presence_of :question, :description
end
