class Examination < ActiveRecord::Base
  belongs_to :user
  has_many :answer_sheets, dependent: :destroy
end
