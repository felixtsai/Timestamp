class CreateDayClasses < ActiveRecord::Migration
  def change
    create_table :day_classes do |t|
      t.string :name
      t.integer :subject_id
      t.integer :grade_level_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
