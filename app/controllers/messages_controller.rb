# frozen_string_literal: true

class MessagesController < ApplicationController
  def index
    @message.images.attach(params[:images])
  end

  def create
    message = Message.create!(message_params)
    message.image.attach(params[:message][:image])
    if message.image.present?
      FaceDetectApiService.new(url_for(message.image)).call

      ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                 message: "Detection done: Your link is: #{Rails.root.join("public/pdfs", "hello.pdf")}"
    end
    head :ok
  end

  private

  def message_params
    params[:message][:user_id] = current_user.id
    params[:message][:chat_room_id] = params[:chat_room_id]

    params.require(:message).permit(:body, :image, :chat_room_id, :user_id)
  end
end
