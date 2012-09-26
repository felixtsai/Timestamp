class AddStatusToStudentAssignment < ActiveRecord::Migration
  def change
    add_column :student_assignments, :status, :string
  end
end
