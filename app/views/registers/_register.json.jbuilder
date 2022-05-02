json.extract! register, :id, :name, :surname, :number, :created_at, :updated_at
json.url register_url(register, format: :json)
