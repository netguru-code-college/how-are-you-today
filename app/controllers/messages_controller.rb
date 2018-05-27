# frozen_string_literal: true

class MessagesController < ApplicationController
  def index
    @message.images.attach(params[:images])
  end

  def create
    binding.pry
    message = Message.create!(message_params)
    message.image.attach(params[:message][:image])
    head :ok
    # indentations / ojtam ojtam
  end

  private

  def message_params
    params.require(:message).permit(:body, :image, :chat_room_id)
    params.merge(user_id: current_user.id)
  end
end
