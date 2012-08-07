require 'spec_helper'

describe "afterschool class creation" do
  it 'allows me to create an afterschool class with a teacher and grade level' do
    visit "/afterschool_classes/"
    click_link "Add Class"
    select('Add Teacher', :from => 'afterschool_class[teacher]')
    fill_in "teacher[name]", :with => "Mr. Smith"
    select('6th Grade', :from => 'afterschool_class[grade_level]')
    click_button "Create Class"
    page.should have_content "Class successfully created!"
  end

  it 'throws an error when grade level is not given' do
    visit "/afterschool_classes/new"
    select('Add Teacher', :from => 'afterschool_class[teacher]')
    fill_in "teacher[name]", :with => "Mr. Smith"
    click_button "Create Class"
    page.should have_content "Please add a grade level!"
  end

  it 'throws an error when teacher is not given' do
    visit "/afterschool_classes/new"
    select('6th Grade', :from => 'afterschool_class[grade_level]')
    click_button "Create Class"
    page.should have_content "Please add a teacher!"
  end

  it 'does not allow me to create the same section twice' do
    visit "/afterschool_classes/new"
    select('Add Teacher', :from => 'afterschool_class[teacher]')
    fill_in "teacher[name]", :with => "Mr. Smith"
    select('6th Grade', :from => 'afterschool_class[grade_level]')
    click_button "Create Class"
    visit "/afterschool_classes/new"
    select('Mr. Smith', :from => 'afterschool_class[teacher]')
    select('6th Grade', :from => 'afterschool_class[grade_level]')
    click_button "Create Class"
    page.should have_content "This class has already been created"
  end
end

describe "afterschool class creation"