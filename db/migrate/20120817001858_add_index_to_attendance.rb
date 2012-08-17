class AddIndexToAttendance < ActiveRecord::Migration
  def change
        add_index :attendances, :session_id
        add_index :attendances, :student_id
  end
end
