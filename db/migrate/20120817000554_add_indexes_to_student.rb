class AddIndexesToStudent < ActiveRecord::Migration
  def change
    add_index :students, :afterschool_class_id
  end
end
