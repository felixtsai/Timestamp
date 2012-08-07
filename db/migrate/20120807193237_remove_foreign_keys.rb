class RemoveForeignKeys < ActiveRecord::Migration
  def up
    remove_column :assignments, :day_class_id
    add_column :assignments, :subject_id, :integer
  end

  def down
    add_column :assignments, :day_class_id, :integer
    remove_column :assignments, :subject_id
  end
end
