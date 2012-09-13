class AfterschoolClass < ActiveRecord::Base
  attr_accessible :grade_level_id, :teachers_attributes, :students_attributes

  has_many :students, :inverse_of => :afterschool_class
  has_many :teachers, :inverse_of => :afterschool_class, :dependent => :destroy
  belongs_to :grade_level
  has_many :sessions, :dependent => :destroy

  validates_presence_of :grade_level, :teachers
  validate :teacher_existence

  has_many :assignments, :through => :grade_level

  accepts_nested_attributes_for :teachers
  accepts_nested_attributes_for :students, :reject_if => proc { |student| student['first_name'].blank? && student['last_name'].blank? }

  def teacher_existence
    if teachers.empty?
      errors.add(:base, "Teachers cannot be empty")
    end
  end

  def teacher_name
    self.grade_level.year + " - " + self.teachers.first.salutation + " " + self.teachers.first.last_name
  end

  def current_session?
    sessions.last.date == Time.now.to_date
  end

  def student_count
    students.count
  end

  def self.afterschool_class_by_grade_teacher
    sorted_afterschool_classes = []
    GradeLevel.all.each do |grade|
      sorted_afterschool_classes += grade.afterschool_classes.sort {|x,y| x.teachers.first.last_name <=> y.teachers.first.last_name}
    end
  return sorted_afterschool_classes    
  end
end




