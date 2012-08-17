class AddIndexToTeacher < ActiveRecord::Migration
  def change
    add_index :teachers, :afterschool_class_id
  end
end
