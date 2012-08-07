class AddAfterschoolClassIdToTeachers < ActiveRecord::Migration
  def up
    add_column :teachers, :afterschool_class_id, :integer
  end

  def down
    remove_column :teachers, :afterschool_class_id
  end
end
