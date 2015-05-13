class AddSubjectIdToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :subject_id, :integer    
  end
end
