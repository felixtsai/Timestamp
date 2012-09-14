class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :semster_period

      t.timestamps
    end
  end
end
