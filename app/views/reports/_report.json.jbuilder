json.extract! report, :id, :file_name, :file_path, :date, :password, :image_path, :created_at, :updated_at
json.url report_url(report, format: :json)
