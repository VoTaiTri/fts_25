class Subject < ActiveRecord::Base
  has_many :examinations, dependent: :destroy
  has_many :questions, dependent: :destroy
  
  validates :name, presence: true, length: {maximum: 50}
  validates :duration, presence: true, numericality: {greater_than: 0}  
end
