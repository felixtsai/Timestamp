class AfterschoolClass < ActiveRecord::Base
  attr_accessible :grade_level_id, :teachers_attributes

  has_many :students
  has_many :teachers, :inverse_of => :afterschool_class
  belongs_to :grade_level
  has_many :sessions

  validates_presence_of :grade_level, :teachers
  validate :teacher_existence

  accepts_nested_attributes_for :teachers

  def teacher_existence
    if teachers.empty?
      errors.add(:base, "Teachers cannot be empty")
    end
  end
end




