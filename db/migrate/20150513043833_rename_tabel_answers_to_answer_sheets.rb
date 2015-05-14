class RenameTabelAnswersToAnswerSheets < ActiveRecord::Migration
  def change
    rename_table :answers, :answer_sheets    
  end
end
