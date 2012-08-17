class AddIndexToSession < ActiveRecord::Migration
  def change
    add_index :sessions, :afterschool_class_id
  end
end
