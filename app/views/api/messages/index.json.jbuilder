json.array! @messages do |message|
  json.extract! message, :sender_id, :recipient_id, :body, :created_at
  json.other_user do
    if message.sender_id == current_user.id
      json.extract! message.recipient.profile, :name, :primary_img_url
    else
      json.extract! message.sender.profile, :name, :primary_img_url
    end
  end
end
