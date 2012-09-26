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

  after_create :create_current_assignments

  def completed_assignments
    self.student_assignments.select { |s_a| s_a.completion_time && s_a.due_date >= Time.zone.now.to_date }
    #day's completed assignments
  end

  def completed_assignments_count
    completed_assignments.length
  end

  def total_outstanding_assignments
    student_assignments.joins(:assignment).where('due_date > ?', Time.zone.now.to_date)
    # self.student_assignments.select { |s_a| s_a.due_date >= Time.zone.now.to_date }
  end

  # TODO: You don't need this, you can just do total_outstanding_assignments.count
  #
  def total_outstanding_assignments_count
    total_outstanding_assignments.length
  end

  def remaining_outstanding_assignments_count
    total_outstanding_assignments_count - completed_assignments_count
  end

  def assignment_completion_percentage
    if total_outstanding_assignments_count == 0
      return "--"
    else
      (completed_assignments_count/total_outstanding_assignments.length.to_f).round(2)*100
    end
  end

  def find_session_attendance(session_id)
    self.attendances.find_by_session_id(session_id)
  end

  def current_class_status(session_id)
    self.attendances.find_by_session_id(session_id).status
  end

  def create_current_assignments
    grade_level.assignments.each do |assignment|
      student_assignments.create(assignment_id: assignment.id) if assignment.due_date >= Time.zone.now.to_date
    end
  end
end
