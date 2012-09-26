class Assignment < ActiveRecord::Base
  attr_accessible :completion_percentage, :description, :due_date, :subject_id, :grade_level_id
  has_many :students, through: :student_assignments
  has_many :student_assignments, :dependent => :destroy
  belongs_to :subject
  belongs_to :grade_level
  delegate :subject_name, to: :subject

  after_create :assign_student_assignments

  validates_presence_of :grade_level
  validates_presence_of :subject
  validates_presence_of :description
  validates_presence_of :due_date


  scope :by_current, where('due_date > ?', Time.zone.now.to_date)
  #scope :by_grade, lambda { |grade_level_id| where('grade_level_id = ?', grade_level_id) }
  scope :by_grade, lambda { |grade_level_id| where(grade_level_id: grade_level_id) }
  scope :by_subject, lambda { |subject| joins(:subject).where('name = ?', subject) }
  #TODO: What does this do differently from has_many :student_assignments
  scope :for_students, joins(:student_assignments)
  scope :completed, for_students.where("student_assignments.completion_time IS NOT NULL")

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |assignment|
        csv << assignment.attributes.values_at(*column_names)
      end
    end
  end

  def assign_student_assignments
    grade_level.students.each do |student|
      StudentAssignment.create(:student_id => student.id, :assignment_id => self.id)
    end
  end

  def self.build_many(assignments_param)
    assignments = []
    assignments_param.each_key do |assignment|
      if assignment != 'grade_level_id' && assignment != 'subject_id'
        assignments << Assignment.new(:grade_level_id => assignments_param[:grade_level_id],
                                      :subject_id     => assignments_param[:subject_id],
                                      :description    => assignments_param[assignment][:description],
                                      :due_date       => assignments_param[assignment][:due_date].to_datetime)
      end
    end
    assignments
  end

  def self.save_all(many_assignments)
    many_assignments.each do |assignment|
      assignment.save
    end
  end

  def completion_percent
    completed = student_assignments.completed.count * 1.0
    total = student_assignments.count* 1.0
    total != 0 ? completed/total * 100.0 : 0.0
  end

end