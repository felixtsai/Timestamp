module AfterschoolClassesHelper
  def heading(afterschool_class)
    "#{ afterschool_class.grade_level.year } - #{ teacher_name(afterschool_class) }"
  end

  def teacher_name(afterschool_class)
    "#{ afterschool_class.teachers.first.salutation } #{ afterschool_class.teachers.first.last_name }"
  end
end
