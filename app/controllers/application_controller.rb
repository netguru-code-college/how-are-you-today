class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  WebNotificationsChannel.broadcast_to(
  current_user,
  title: 'New things!',
  body: 'All the news fit to print'
)
end
