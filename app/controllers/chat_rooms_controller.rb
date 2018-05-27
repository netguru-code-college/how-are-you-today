# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = "Chat room added!"
      redirect_to chat_rooms_path
    else
      render "new"
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "this is a pdf"
        send_data pdf.render, filename: "mypdf.pdf",
                      type: "application/pdf",
  	              disposition: "inline"
      end
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
