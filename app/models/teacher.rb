class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :afterschool_class_id, :salutation

  belongs_to :afterschool_class
  has_many :day_classes
end
