class Teacher < ActiveRecord::Base
  attr_accessible :salutation, :first_name, :last_name, :afterschool_class_id

  validates_presence_of :salutation, :first_name, :last_name
  validates_uniqueness_of :first_name, :scope => :last_name

  belongs_to :afterschool_class, :inverse_of => :teachers
end
