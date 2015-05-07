class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :subject_id
      t.integer :question_id
      t.integer :option_id
      t.integer :answer_sheet_id
      t.text :answer_content

      t.timestamps null: false
    end
  end
end
