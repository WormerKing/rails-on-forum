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

	def validate_permission!(user)
		unless current_user == user
			flash[:error] = "Bu işlemi gerçekleştirebilmek için oturum açmalısınız."
			redirect_to login_path
		end
	end
	def validate_user!
		unless signed_in?
			notice[:warning] = "Bu işlemi gerçekleştirebilmek için oturum açmış olmanız gerekiyor"
			redirect_to login_path
		end
	end

	helper_method :current_user,:signed_in?
end
