require 'spec_helper'

describe "starting a session of an afterschool class" do
  before :each do
    visit "/afterschool_classes/"
    click_link "Add Class"
    select('Mr.', :from => 'afterschool_class[teachers_attributes][0][salutation]')
    fill_in "afterschool_class[teachers_attributes][0][first_name]", :with => "John"
    fill_in "afterschool_class[teachers_attributes][0][last_name]", :with => "Smith"
    select('6th Grade', :from => 'afterschool_class[grade_level_id]')
    click_button "Create Class"
    AfterschoolClass.last.students.create(first_name: "Austin", last_name: "Wang")
    visit "/afterschool_classes/"
  end


  it "displays a list of every student in the class" do
    click_link "Start class"
    page.should have_content('John Smith')
    page.should have_content('6th Grade')
    page.should have_content('Student Roster')
    page.should have_content('Austin Wang')
  end

  it "should not allow a class to be started if there is already one started" do
    click_link "Start class"
    visit "/afterschool_classes/"
    page.should_not have_content("Start class")
  end

  it "should have a delete button that takes you back to the after_school classes index" do
    click_link "Start class"
    click_button "Delete Session"
    page.should have_content('Session has been ended')
    page.should have_content('Afterschool Class List')
  end
end