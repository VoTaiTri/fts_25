class AnswerSheet < ActiveRecord::Base
  belongs_to :examination
  belongs_to :subject
  has_many :answers, dependent: :destroy
end
