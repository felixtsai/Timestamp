class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :session_id
      t.integer :student_id
      t.string :status

      t.timestamps
    end
  end
end
