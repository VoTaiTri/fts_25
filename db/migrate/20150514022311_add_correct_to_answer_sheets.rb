class AddCorrectToAnswerSheets < ActiveRecord::Migration
  def change
    add_column :answer_sheets, :correct, :boolean, default: false
  end
end
