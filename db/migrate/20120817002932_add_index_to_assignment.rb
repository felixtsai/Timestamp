class AddIndexToAssignment < ActiveRecord::Migration
  def change
    add_index :assignments, :subject_id
    add_index :assignments, :grade_level_id
  end
end
