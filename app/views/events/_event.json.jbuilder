json.extract! event, :id, :title, :description, :location, :start_time, :end_time, :capacity, :price, :created_at, :updated_at
json.url event_url(event, format: :json)
