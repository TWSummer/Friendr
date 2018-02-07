json.extract! @search_query, :id, :min_age, :max_age, :max_distance, :active_within
json.results do
  json.array! @search_result do |result|
    json.id result.id
    json.username result.username
    json.name result.profile.name
    json.age result.profile.age
    json.primary_img_url result.profile.primary_img_url
    json.compatibility (calculate_match_percentage(@cur_user, result)* 100).round(1)
    json.distance distance([@cur_user.profile.latitude, @cur_user.profile.longitude],
                           [result.profile.latitude, result.profile.longitude])
  end
end
@search_result = nil
