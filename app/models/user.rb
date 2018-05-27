# frozen_string_literal: true

# Description/Explanation of User class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :memberships

  def name
    email.split("@")[0]
  end

  def online?
    updated_at > 2.minutes.ago
  end
end
