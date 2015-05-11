class AddAnswerSheetsColumnToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :submited_duration, :integer, default: 0
    add_column :examinations, :end_testing_at, :date
  end
end
