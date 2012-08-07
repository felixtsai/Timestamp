class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :grade_level_id
      t.integer :afterschool_class_id

      t.timestamps
    end
  end
end
