json.array!(@groups) do |group|
  json.extract! group, :id, :name, :has_many_members, :description
  json.url group_url(group, format: :json)
end
