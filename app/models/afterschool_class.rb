class AfterschoolClass < ActiveRecord::Base
  attr_accessible :grade_level_id

  has_many :students
  has_one :teacher
end
