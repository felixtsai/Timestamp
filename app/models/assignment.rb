class Assignment < ActiveRecord::Base
  attr_accessible :completion_percentage, :description, :due_date, :subject_id, :grade_level_id
  has_many :students, through: :student_assignments
  has_many :student_assignments
  belongs_to :subject
  belongs_to :grade_level

  after_create :assign_student_assignments

  validates_presence_of :grade_level
  validates_presence_of :subject
  validates_presence_of :description
  validates_presence_of :due_date

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


end