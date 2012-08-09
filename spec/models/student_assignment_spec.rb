require 'spec_helper'
require 'fabrication'

describe StudentAssignment do
  it { should belong_to :assignment }
  it { should belong_to :student }

  # it "should check whether a student has been signed in for the day" do
  #   @grade_level = GradeLevel.create(year: "7th Grade")
  #   @teacher = Teacher.create(salutation => "Mr.", first_name =>"smirla", last_name =>"poqer")
  #   @teacher.@afterschool_class = AfterschoolClass.create(grade_level_id: @grade_level.id)
  #   @student = Student.create(first_name: 'Sally', last_name: 'Ride', afterschool_class_id: @afterschool_class.id)
  #   @session = @afterschool_class.sessions.create( date: Time.now.to_date, start_time: Time.now)
  #   @attendance = Attendance.create(session_id: @session.id, student_id: @student.id)
  #   @student.find_session_attendance(@session.id).should_not be_nil
  # end
end