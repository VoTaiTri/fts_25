class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.integer :user_id
      t.string :status, default: "Start"

      t.timestamps null: false
    end
  end
end
