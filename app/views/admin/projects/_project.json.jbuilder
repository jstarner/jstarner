json.extract! project, :id, :title, :image, :short_desc, :long_desc, :project_link, :created_at, :updated_at
json.url project_url(project, format: :json)
