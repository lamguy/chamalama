json.array!(@timelines) do |timeline|
  json.extract! timeline, :id, :name
  json.url timeline_url(timeline, format: :json)
end
