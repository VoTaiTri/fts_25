class Question < ActiveRecord::Base
  belongs_to :subject
  has_many :answers
  has_many :options, dependent: :destroy
end
