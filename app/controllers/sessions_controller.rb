class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      #redirect_to admin_url
      redirect_to products_url 
    else
      #render new_user_path
      redirect_to login_url, alert: "Неверная комбинация имени и пароля"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Сеанс работы завершен"

  end
end
