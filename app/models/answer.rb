class Answer < ActiveRecord::Base
  belongs_to :subject
  belongs_to :question
  belongs_to :option
  belongs_to :answer_sheet
end
