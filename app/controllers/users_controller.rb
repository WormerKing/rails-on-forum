class UsersController < ApplicationController
	before_action :select_user,only: %i[ update edit show destroy]
	before_action only:%i[ edit update destroy ] do
		validate_permission! select_user
	end
	rescue_from ActiveRecord::RecordNotFound,with: :load_error_page
	def new
		if signed_in?
			flash[:warning] = "Zaten giriş yapmışsınız"
			redirect_to "/"
		end
		@user = User.new
	end
	
	def update		
		update_params = user_params

		if update_params.has_key?(:password)
			update_params.delete([:password,:password_digest])
		end

		if @user.update(user_params)
			flash[:notice] = "Profil bilgileriniz güncellendi"
			redirect_to(profile_path(@user))
		else
			render :edit,layout:"profile"
		end
	end
	
	def edit
		render layout:"profile"
	end

	def create
		@id = (User.last.id + 1) unless User.last == nil
		@id ||= 1

		@user = User.new(user_params)

		@user.id = @id

		if @user.save
			login(@user)
			flash[:notice] = "Kayıt başarıyla eklendi :)"
			redirect_to(profile_path(@user))
		else
			render :new
		end
	end
	
	def show
		sayfa = params[:sayfa] || "konular"

		if sayfa == "konular"
			@data = @user.topic
		else
			@data = @user.comments
		end

		render layout:"profile",locals:{page:sayfa}
	end

	def destroy
		logout
		@user.destroy
		flash[:warning] = "Hesabınız başarıyla silindi"
		redirect_to register_path
	end

	private
	def user_params
		params.require(:user).permit!
	end
	def load_error_page
		render file:"#{Rails.root}/public/404.html",status: :not_found
	end
	def select_user 
		@user = User.find_by_username(params[:id])

		unless @user
			render file:"#{Rails.root}/public/404.html",status: :not_found
		end
		@user
	end
end
