class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	private
	def login(user)
		session[:user_id] = user.id
	end
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def signed_in?
		current_user
	end

	helper_method :current_user,:signed_in?
end
