class DropTableDayClass < ActiveRecord::Migration
  def change
    drop_table :day_classes
    drop_table :classes_students
  end
end
