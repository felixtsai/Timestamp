class RemoveGradeLevelIdFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :grade_level_id
  end
end
