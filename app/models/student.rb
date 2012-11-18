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

  def completed_assignments_today_count
    student_assignments.joins(:assignment).completed.where('due_date > ?', Time.zone.now.to_date).count
  end

  def completed_assignments_to_date_count
    student_assignments.joins(:assignment).completed.count
  end

  def all_assignments_today
    student_assignments.joins(:assignment).where('due_date > ?', Time.zone.now.to_date)
  end

  def all_assignments_by_due_date
    s_as = student_assignments.includes(:assignment)
    s_as.sort { |a,b| a.assignment.due_date <=> b. assignment.due_date }
  end

  def outstanding_assignments_to_date_count
    student_assignments.joins(:assignment).where("student_assignments.completion_time IS NULL").count
  end

  def outstanding_assignments_today_count
    student_assignments.joins(:assignment).where("student_assignments.completion_time IS NULL AND due_date > ?", Time.zone.now.to_date).count
  end

  def assignment_completion_percentage_today
    if outstanding_assignments_today_count == 0
      return "--"
    else
      (completed_assignments_today_count/all_assignments_today.length.to_f).round(2)*100
    end
  end

  def overall_assignment_completion_percentage
    (completed_assignments_to_date_count/student_assignments.count.to_f).round(2)*100
  end

  def find_session_attendance(session_id)
    self.attendances.find_by_session_id(session_id)
  end

  def current_class_status(session_id)
    self.attendances.find_by_session_id(session_id).status
  end

  def create_current_assignments
    grade_level.assignments.each do |assignment|
      student_assignments.create(assignment_id: assignment.id) if assignment.due_date > Time.zone.now.to_date
    end
  end

  def on_time_percentage
  end

  def overall_attendance_percentage
  end

end
