# frozen_string_literal: true

# Description/Explanation of ChatRoom class
class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
end
