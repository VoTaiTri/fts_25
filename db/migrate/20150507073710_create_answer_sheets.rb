class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
      t.integer :examination_id
      t.integer :subject_id
      t.integer :submited_duration
      t.string :status

      t.timestamps null: false
    end
  end
end
