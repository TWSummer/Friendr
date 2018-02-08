class Api::MessagesController < ApplicationController

  def index
    @messages = Message.all.where("sender_id = ? or recipient_id = ?",
                                  current_user.id, current_user.id)
                        .includes(sender: :profile)
                        .includes(recipient: :profile)
    render :index
  end

  def show
    other_user = User.find_by(username: params[:username])
    if other_user
      sent = Message.all.where("sender_id = ? and recipient_id = ?",
                               current_user.id, other_user.id)
      received = Message.all.where("sender_id = ? and recipient_id = ?",
                                   other_user.id, current_user.id)
      @messages = sent.to_a.concat(received.to_a)
      render :show
    else
      render json: "Could not locate conversation with this user", status: 404
    end
  end

  def create
    @message = Message.new(
      body: params[:message][:body],
      sender_id: current_user.id,
      recipient_id: params[:message][:recipient_id]
    )
    if @message.save
      render :create
    else
      render json: @message.errors.full_messages, status: 422
    end
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :body)
  end
end
