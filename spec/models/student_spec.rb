require 'spec_helper'

describe Student do
  it { should have_many :sessions }
  it { should have_many :student_assignments }
  it { should have_many :assignments }
  it { should belong_to :afterschool_class }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :afterschool_class }


  before(:each) do
    @class = AfterschoolClass.create(grade_level_id: 1, teachers_attributes: {"0" => {salutation: "Mr.", first_name: "Janky", last_name: "Jank"}})
    @student1 = Student.create(first_name: 'Doctor', last_name: 'Who', afterschool_class_id: @class.id)
    @student2 = Student.create(first_name: 'Rose', last_name: 'Tyler', afterschool_class_id: @class.id)
    @student3 = Student.create(first_name: 'Martha', last_name: 'Jones', afterschool_class_id: @class.id)
    @student4 = Student.create(first_name: 'Donna', last_name: 'Noble', afterschool_class_id: @class.id)
    @student5 = Student.create(first_name: 'Jack', last_name: 'Harkness', afterschool_class_id: @class.id)    
    @session = Session.create(date: Time.zone.now.to_date, start_time: Time.zone.now, afterschool_class_id: @class.id)
    @attendance1 = Attendance.create(student_id: @student1.id, session_id: @session.id)
    @attendance2 = Attendance.create(student_id: @student2.id, session_id: @session.id)
    @attendance3 = Attendance.create(student_id: @student3.id, session_id: @session.id)
    @attendance4 = Attendance.create(student_id: @student4.id, session_id: @session.id)
    @attendance1.update_attributes(status: "Late")
    @assignment1 = Assignment.create(description: "add things", due_date: Time.zone.now.to_date + 1, grade_level_id: 1, subject_id: 1)
    @assignment2 = Assignment.create(description: "congress", due_date: Time.zone.now.to_date + 1, grade_level_id: 1, subject_id: 2)
    StudentAssignment.find_by_student_id_and_assignment_id(@student1.id, @assignment1.id)
  end

end
