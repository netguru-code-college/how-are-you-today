# frozen_string_literal: true

class MessagesController < ApplicationController
  def index
    @message.images.attach(params[:images])
  end

  def create
    message = Message.create!(message_params)
    message.image.attach(params[:message][:image])
    head :ok
  end

  private

  def message_params
    params[:message][:user_id] = current_user.id
    params[:message][:chat_room_id] = params[:chat_room_id]

    params.require(:message).permit(:body, :image, :chat_room_id, :user_id)
  end
end
