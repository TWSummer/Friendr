json.extract! @message, :sender_id, :recipient_id, :body, :created_at
json.other_user do
  json.extract! @message.recipient.profile, :name, :primary_img_url
end
