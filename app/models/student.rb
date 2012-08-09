class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :afterschool_class_id, :student_assignments

  has_one :grade_level, :through => :afterschool_class
  belongs_to :afterschool_class, :inverse_of => :students
  has_many :student_assignments
  has_many :assignments, through: :student_assignments
  has_many :attendances
  has_many :sessions, through: :attendances


  validates_presence_of :first_name, :last_name, :afterschool_class

  # def grade_level
  #   self.grade_level
  # end
  def signed_in?(session_id)
    self.attendances.find_by_session_id(session_id)
  end

  def current_class_status(session_id)
    self.attendances.find_by_session_id(session_id).status
  end
end
