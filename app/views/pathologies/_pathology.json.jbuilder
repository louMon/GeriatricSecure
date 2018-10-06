json.extract! pathology, :id, :idpathology, :cie10_code, :pathology_name, :description, :created_at, :updated_at
json.url pathology_url(pathology, format: :json)
