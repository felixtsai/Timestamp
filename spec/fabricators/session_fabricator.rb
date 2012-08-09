Fabricator(:session) do
  afterschool_class_id Fabricate(:afterschool_class).id
  date                 Time.now.to_date
  start_time           Time.now
end
