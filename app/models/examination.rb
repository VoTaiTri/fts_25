class Examination < ActiveRecord::Base
  after_create -> {create_answer_sheet}
  
  belongs_to :user
  belongs_to :subject
  has_one :answer_sheet, dependent: :destroy
end
