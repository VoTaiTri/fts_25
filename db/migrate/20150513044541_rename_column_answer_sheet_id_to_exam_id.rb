class RenameColumnAnswerSheetIdToExamId < ActiveRecord::Migration
  def change
    rename_column :answer_sheets, :answer_sheet_id, :examination_id
  end
end
