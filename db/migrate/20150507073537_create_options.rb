class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :description
      t.boolean :correct, default: false

      t.timestamps null: false
    end
  end
end
