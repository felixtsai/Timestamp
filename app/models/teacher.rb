class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  belongs_to :afterschool_class
end
