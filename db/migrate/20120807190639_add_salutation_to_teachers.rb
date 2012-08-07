class AddSalutationToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :salutation, :string
  end
end
