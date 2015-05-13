class Subject < ActiveRecord::Base
  has_many :examinations, dependent: :destroy
  has_many :questions, dependent: :destroy
  
  validates_presence_of :name, :duration
  validates_numericality_of :duration
end
