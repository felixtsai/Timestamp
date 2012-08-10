require 'spec_helper'

describe "creating an assignment" do
  it "allows me to create an assignment with a grade level and subject" do
    visit "/assignments/new"
    page.should have_content("Create new assignment")
    select('6th Grade', :from => 'assignment[grade_level_id]')
    select('Math', :from => 'assignment[subject_id]')
    fill_in "assignment[0][description]", :with => "Write an essay on Moby Dick"
    fill_in "assignment[0][due_date]", :with => '2012-08-10'
    click_button "Create Assignment"
    page.should have_content("Assignments added")
  end

  it "gives error messages if assignment is invalid" do
    visit "/assignments/new"
    page.should have_content("Create new assignment")
    fill_in "assignment[0][description]", :with => "Write an essay on Moby Dick"
    fill_in "assignment[0][due_date]", :with => '2012-08-10'
    click_button "Create Assignment"
    page.should have_content("Grade level can't be blank")
    page.should have_content("Subject can't be blank")
  end
end