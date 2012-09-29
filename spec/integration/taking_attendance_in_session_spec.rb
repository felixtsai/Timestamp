# require 'spec_helper'

# describe "taking attendance for kids" do
#   before :each do
#     visit "/afterschool_classes/"
#     click_link "Add Class"
#     select('Mr.', :from => 'afterschool_class[teachers_attributes][0][salutation]')
#     fill_in "afterschool_class[teachers_attributes][0][first_name]", :with => "John"
#     fill_in "afterschool_class[teachers_attributes][0][last_name]", :with => "Smith"
#     select('6th Grade', :from => 'afterschool_class[grade_level_id]')
#     click_button "Create Class"
#     AfterschoolClass.last.students.create(first_name: "Austin", last_name: "Wang", grade_level_id: 1)
#     visit "/afterschool_classes/"
#   end

#   it "should allow a teacher to mark down the attendance of a student" do
#     click_link "Start class"
#     page.should have_content "Sign in"
#     click_link "Sign in"
#     page.should have_content "On time"
#   end

# end
