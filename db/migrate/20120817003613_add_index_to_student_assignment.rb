class AddIndexToStudentAssignment < ActiveRecord::Migration
  def change
    add_index :student_assignments, :student_id
    add_index :student_assignments, :assignment_id
  end
end
