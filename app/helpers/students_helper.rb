module StudentsHelper
  def full_name(student)
    student.first_name + " " + student.last_name
  end
end
