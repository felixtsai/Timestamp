# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

GradeLevel.find_or_create_by_year("6th Grade")
GradeLevel.find_or_create_by_year("6th Grade - DI")
GradeLevel.find_or_create_by_year("7th Grade")
GradeLevel.find_or_create_by_year("8th Grade")

Subject.find_or_create_by_name("English Language Arts (ELA)")
Subject.find_or_create_by_name("Math")
Subject.find_or_create_by_name("Social Studies")
Subject.find_or_create_by_name("Science")
Subject.find_or_create_by_name("Extra Credit")

Admin.create(email: "user@example.com", password: "foobar")
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
