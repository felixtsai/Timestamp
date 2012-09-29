# require 'spec_helper'

# describe "afterschool class creation" do

#   it 'allows me to create an afterschool class with a teacher and grade level' do
#     visit "/afterschool_classes/new"
#     select('Mr.', :from => 'afterschool_class[teachers_attributes][0][salutation]')
#     fill_in "afterschool_class[teachers_attributes][0][first_name]", :with => "John"
#     fill_in "afterschool_class[teachers_attributes][0][last_name]", :with => "Smith"
#     select('7th Grade', :from => 'afterschool_class[grade_level_id]')
#     click_button "Create Class"
#     page.should have_content "Class successfully created!"
#     page.should have_content "6th Grade - Mr. Smith"
#   end

#   it 'throws an error when grade level is not given' do
#     visit "/afterschool_classes/new"
#     select('Mr.', :from => 'afterschool_class[teachers_attributes][0][salutation]')
#     fill_in "afterschool_class[teachers_attributes][0][first_name]", :with => "John"
#     fill_in "afterschool_class[teachers_attributes][0][last_name]", :with => "Smith"
#     click_button "Create Class"
#     page.should have_content "Grade level can't be blank"
#   end

#   it 'throws an error when teacher is not given' do
#     visit "/afterschool_classes/new"
#     select('6th Grade', :from => 'afterschool_class[grade_level_id]')
#     click_button "Create Class"
#     page.should have_content "Teachers first name can't be blank"
#   end

#   it 'does not allow me to create the same section twice' do
#     visit "/afterschool_classes/new"
#     select('Mr.', :from => 'afterschool_class[teachers_attributes][0][salutation]')
#     fill_in "afterschool_class[teachers_attributes][0][first_name]", :with => "John"
#     fill_in "afterschool_class[teachers_attributes][0][last_name]", :with => "Smith"
#     select('6th Grade', :from => 'afterschool_class[grade_level_id]')
#     click_button "Create Class"
#     visit "/afterschool_classes/new"
#     select('Mr.', :from => 'afterschool_class[teachers_attributes][0][salutation]')
#     fill_in "afterschool_class[teachers_attributes][0][first_name]", :with => "John"
#     fill_in "afterschool_class[teachers_attributes][0][last_name]", :with => "Smith"
#     select('6th Grade', :from => 'afterschool_class[grade_level_id]')
#     click_button "Create Class"
#     page.should have_content "Teachers first name has already been taken"
#   end

#   it 'allows me to add students to create an afterschool class' do
#     visit "/afterschool_classes/new"
#     select('Mr.', :from => 'afterschool_class[teachers_attributes][0][salutation]')
#     fill_in "afterschool_class[teachers_attributes][0][first_name]", :with => "John"
#     fill_in "afterschool_class[teachers_attributes][0][last_name]", :with => "Smith"
#     select('6th Grade', :from => 'afterschool_class[grade_level_id]')
#     click_link "Add Student"
#     fill_in "afterschool_class[students_attributes][0][first_name]", :with => "John"
#     fill_in "afterschool_class[students_attributes][0][last_name]", :with => "Doe"
#     click_button "Create Class"
#   end

#   # it 'adds more student forms by clicking add student link' do
#   #   visit "/afterschool_classes/new"
#   #   fill_in "afterschool_class[students_attributes][0][first_name]", :with => "John"
#   #   fill_in "afterschool_class[students_attributes][0][last_name]", :with => "Doe"
#   #   click_link "Add Student"
#   #   save_and_open_page
#   #   fill_in "afterschool_class[students_attributes][1][first_name]", :with => "Jane"
#   #   fill_in "afterschool_class[students_attributes][1][last_name]", :with => "Smith"
#   # end
# end
