# frozen_string_literal: true

# Description/Explanation of Message class
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  has_one_attached :image

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  validates :body, presence: true, length: { minimum: 4, maximum: 1000 }

  def timestamp
    created_at.strftime("%H:%M:%S %d %B %Y")
  end
end
