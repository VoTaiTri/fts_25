class ChangeEndTestingAtDatatypeToDateTime < ActiveRecord::Migration
  def change
    change_column :examinations, :end_testing_at, :datetime
  end
end
