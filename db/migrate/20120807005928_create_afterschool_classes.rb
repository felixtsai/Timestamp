class CreateAfterschoolClasses < ActiveRecord::Migration
  def change
    create_table :afterschool_classes do |t|
      t.integer :grade_level_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
