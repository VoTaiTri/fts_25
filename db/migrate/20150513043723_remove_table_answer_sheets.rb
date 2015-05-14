class RemoveTableAnswerSheets < ActiveRecord::Migration
  def change
    drop_table :answer_sheets
  end
end
