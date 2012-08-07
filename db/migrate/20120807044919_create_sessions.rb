class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :afterschool_class_id
      t.date :date
      t.datetime :start_time

      t.timestamps
    end
  end
end
