json.array!(@log_views) do |log_view|
  json.extract! log_view, :id, :project_id, :log_type_id, :log_file
  json.url log_view_url(log_view, format: :json)
end
