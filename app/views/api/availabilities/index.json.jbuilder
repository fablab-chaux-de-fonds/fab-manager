json.array!(@availabilities) do |availability|
  json.id availability.id
  json.title availability.title
  json.start availability.start_at.iso8601
  json.end availability.end_at.iso8601
  json.available_type availability.available_type
  if availability.instance_of? Availability
    json.description availability.description
    json.username availability_username(availability)
  end
  json.machine_ids availability.machine_ids
  json.training_ids availability.training_ids
  json.textColor availability_text_color(availability)
  json.backgroundColor availability_background_color(availability, availability.lock)
  json.borderColor availability_border_color(availability)
  json.tag_ids availability.tag_ids
  json.tags availability.tags do |t|
    json.id t.id
    json.name t.name
  end
  json.lock availability.lock
end
