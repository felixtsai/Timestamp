class AddColumnAfterschoolClass < ActiveRecord::Migration
  def change
    add_column :afterschool_classes, :semester_id, :integer
  end
end
