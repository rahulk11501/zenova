json.extract! booking, :id, :user_id, :event_id, :status, :tickets_count, :created_at, :updated_at
json.url booking_url(booking, format: :json)
