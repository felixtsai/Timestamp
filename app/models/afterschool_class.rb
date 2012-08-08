class AfterschoolClass < ActiveRecord::Base
  attr_accessible :grade_level_id, :teachers_attributes, :students_attributes

  has_many :students, :inverse_of => :afterschool_class
  has_many :teachers, :inverse_of => :afterschool_class
  belongs_to :grade_level
  has_many :sessions

  validates_presence_of :grade_level, :teachers
  validate :teacher_existence

  accepts_nested_attributes_for :teachers
  accepts_nested_attributes_for :students, :reject_if => proc { |student| student['first_name'].blank? }

  def teacher_existence
    if teachers.empty?
      errors.add(:base, "Teachers cannot be empty")
    end
  end
end




