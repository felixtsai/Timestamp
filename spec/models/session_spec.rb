require 'spec_helper'

describe Session do
  it {should belong_to :afterschool_class}
  it {should have_many :students }
  it {should have_many :attendances}
  it {should have_many :assignments}
  it {should have_many :student_assignments}
  it {should have_one :teacher}


  it "should have a method today that shows all the sessions for the day." do
    class_1 = Session.create(afterschool_class_id: 1, date: Time.zone.now.to_date)
    class_2 = Session.create(afterschool_class_id: 2, date: Time.zone.now.to_date)
    class_3 = Session.create(afterschool_class_id: 3, date: "1999-01-01")
    Session.today.should include class_1
    Session.today.should include class_2
    Session.today.should_not include class_3
	end
end

describe "UniqueClassValidator" do

	it "should prevent two sessions of the same class from being created in one day" do
		class_1 = Session.create(afterschool_class_id: 4, date: Time.zone.now.to_date)
  	class_2 = Session.create(afterschool_class_id: 4, date: Time.zone.now.to_date)
  	Session.all.should include class_1
  	Session.all.should_not include class_2
  end
  
end

describe "Session stats" do

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
  end


  describe "session_student_count" do
    it "should count the total students attending the session" do
      @session.session_student_count.should == 4
    end

    it "should provide a count of absent students" do
      @session.absent_count.should == 1
    end

    it "should provide a count of on time students" do
      @session.on_time_count.should == 3
    end

    it "should provide a count of late students" do
      @session.late_count.should == 1
    end

    it "should provide an overall attendance percentage" do
      @session.overall_attendance_percent.should == "80%"
    end

    it "should provide overall assignment completion percentage for the class" do
      @student1.student_assignments.first.update_attributes(:completion_time => Time.now)
      @session.overall_assignment_completion_percentage.should == "12.5%"
    end

    it "should provide assignment completion percentage by subject" do
      @student1.student_assignments.first.update_attributes(:completion_time => Time.now)
      @session.subject_completion_percentage(Subject.find(1).name).should == "25%"
    end
  end

end