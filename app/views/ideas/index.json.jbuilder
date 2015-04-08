json.array!(@ideas) do |idea|
  json.extract! idea, :id, :idea_description, :idea_benefit, :priority, :idea_status, :email, :supervisor_email
  json.url idea_url(idea, format: :json)
end
