class UsersController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound,with: :load_error_page
	def new
		@user = User.new
	end
	
	def update
		@user = User.find(params[:id])

		update_params = user_params

		if update_params.has_key?(:password)
			update_params.delete([:password,:password_digest])
		end

		if @user.update(user_params)
			flash[:notice] = "Profil bilgileriniz güncellendi"
			redirect_to @user
		else
			render :edit,layout:"profile"
		end
	end
	def edit
		@user = User.find(params[:id])
		render layout:"profile"
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "Kayıt başarıyla eklendi :)"
			redirect_to(@user)
		else
			render :new
		end
	end
	
	def show
		@user = User.find(params[:id])
		@data = []

		if params[:sayfa]
			render layout:"profile",locals:{page:params[:sayfa]}
		else
			render layout:"profile",locals:{page:"konular"}
		end
	end

	def destroy
		@user = User.find(params[:id])

		@user.destroy

		redirect_to(register_path)
	end
	private
	def user_params()
		params.require(:user).permit!
	end
	private
	def load_error_page
		render file:"#{Rails.root}/public/404.html",status: :not_found
	end
end
