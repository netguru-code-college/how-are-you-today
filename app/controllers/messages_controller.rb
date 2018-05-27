# frozen_string_literal: true

class MessagesController < ApplicationController
	def index
    @message.images.attach(params[:images])
  end

  def create
  	binding.pry
    message = Message.create!(message_params)
    #message.image.attach(params[:message][:image])
    head :ok
  end

  private

  def message_params
  	params.require(:message).permit(:body, :image)
  end
end
