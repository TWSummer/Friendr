json.array! @messages do |message|
  json.extract! message, :sender_id, :recipient_id, :body, :created_at
end
