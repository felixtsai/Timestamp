Fabricator(:session) do
  afterschool_class_id Fabricate(:afterschool_class).id
  date                 Time.zone.now.to_date
  start_time           Time.zone.now
end
