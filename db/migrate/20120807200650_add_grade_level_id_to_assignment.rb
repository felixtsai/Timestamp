class AddGradeLevelIdToAssignment < ActiveRecord::Migration
  def up
    add_column :assignments, :grade_level_id, :integer
  end

  def down
    remove_column :assignments, :grade_level_id
  end

end
