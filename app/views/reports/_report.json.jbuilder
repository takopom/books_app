json.extract! report, :id, :title, :description, :reported_on, :user_id, :created_at, :updated_at
json.url report_url(report, format: :json)
