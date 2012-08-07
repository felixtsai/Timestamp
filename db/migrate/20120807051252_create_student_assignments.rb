class CreateStudentAssignments < ActiveRecord::Migration
  def change
    create_table :student_assignments do |t|
      t.datetime :completion_time
      t.integer :student_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
