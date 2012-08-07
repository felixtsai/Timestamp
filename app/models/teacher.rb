class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :afterschool_class_id, :salutation

  validates_presence_of :salutation, :first_name, :last_name

  belongs_to :afterschool_class, :inverse_of => :teachers
end
