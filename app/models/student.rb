class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :afterschool_class_id, :student_assignments_attributes

  has_one :grade_level, :through => :afterschool_class
  belongs_to :afterschool_class, :inverse_of => :students
  has_many :student_assignments, :order => "created_at", :dependent => :destroy
  has_many :assignments, through: :student_assignments
  has_many :attendances, :dependent => :destroy
  has_many :sessions, through: :attendances


  validates_presence_of :first_name, :last_name, :afterschool_class
  accepts_nested_attributes_for :student_assignments

  def outstanding_assignments
    student_assignments.select { |s_a| s_a.due_date >= Date.today }
  end

  def outstanding_assignments_count
    outstanding_assignments.select { |s_a| !s_a.completion_time }.length
  end

  def find_session_attendance(session_id)
    self.attendances.find_by_session_id(session_id)
  end

  def current_class_status(session_id)
    self.attendances.find_by_session_id(session_id).status
  end
end
