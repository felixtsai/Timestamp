class RemoveTeacherIdFromAfterschoolClass < ActiveRecord::Migration
  def up
    remove_column :afterschool_classes, :teacher_id
  end

  def down
    add_column :afterschool_classes, :teacher_id
  end
end
