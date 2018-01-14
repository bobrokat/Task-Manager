json.extract! api_application, :id, :—skip-template-engine, :created_at, :updated_at
json.url api_application_url(api_application, format: :json)
