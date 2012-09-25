# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

GradeLevel.find_or_create_by_year("6th Grade - A")
GradeLevel.find_or_create_by_year("6th Grade - B")
GradeLevel.find_or_create_by_year("7th Grade")
GradeLevel.find_or_create_by_year("8th Grade")

Subject.find_or_create_by_name("English Language Arts (ELA)")
Subject.find_or_create_by_name("Math")
Subject.find_or_create_by_name("Social Studies")
Subject.find_or_create_by_name("Science")
Subject.find_or_create_by_name("Extra Credit")