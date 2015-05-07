class AnswerSheet < ActiveRecord::Base
  belongs_to :examination
  belongs_to :subject
end
