class Session < ActiveRecord::Base
  attr_accessible :afterschool_class_id, :date, :start_time

  belongs_to :afterschool_class
  has_many :attendances
  has_many :students, through: :attendances

end
