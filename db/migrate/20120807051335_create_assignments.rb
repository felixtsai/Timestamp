class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :day_class_id
      t.string :description
      t.date :due_date
      t.decimal :completion_percentage

      t.timestamps
    end
  end
end
