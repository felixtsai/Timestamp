require 'ffaker'

Fabricator(:student) do
  first_name           {Faker::Name.first_name}
  last_name            {Faker::Name.last_name}
  grade_level_id       1
  afterschool_class_id 1
end
