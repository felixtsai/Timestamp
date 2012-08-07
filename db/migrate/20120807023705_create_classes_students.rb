class CreateClassesStudents < ActiveRecord::Migration
  def change
    create_table :classes_students do |t|
      t.integer :student_id
      t.integer :day_class_id

      t.timestamps
    end
  end
end
