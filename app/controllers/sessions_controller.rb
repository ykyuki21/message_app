class SessionsController < ApplicationController
  def index
    redirect_to root_path if is_logged_in?
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "ログインしました。"
      redirect_to root_path
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render 'index'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました。"
    redirect_to root_path
  end
end