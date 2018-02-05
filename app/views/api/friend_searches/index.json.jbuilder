json.extract! @search_query, :min_age, :max_age, :max_distance, :active_within
json.results do
  json.array! @search_result do |result|
    json.name result.profile.name
    json.age result.profile.age
  end
end
