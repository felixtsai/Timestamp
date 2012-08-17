class AddIndexToAfterschoolClass < ActiveRecord::Migration
  def change
    add_index :afterschool_classes, :grade_level_id
  end
end
