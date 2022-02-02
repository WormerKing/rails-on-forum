class SessionsController < ApplicationController
  def new
    if signed_in?
      flash[:warning] = "Zaten giriş yapmışsınız"
      redirect_to "/"
    end
  end

  def create
    user = User.find_by_username(params[:session][:user_name])

    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to "/",notice:"Başarıyla giriş yapıldı"
    else
      flash[:error] = "Kullanıcı adı/parola hatalı"
      redirect_to login_path
    end
  end

  def destroy
    logout  
    redirect_to "/",notice:"Oturumunuz sonlandırıldı"
  end
end
