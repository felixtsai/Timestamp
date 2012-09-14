class Semester < ActiveRecord::Base
  attr_accessible :semster_period
  has_many :after_school_classes
end
