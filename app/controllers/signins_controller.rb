class SigninsController < ApplicationController
  def index
  end

  def login
    @user = YAML.load(session[:user])
    userid = params[:userid]
    password = params[:password]
    if (userid == @user.userid && password == @user.password)
      session[:userid] = @user.userid
    else
      flash[:alert] = "Log in failed, try again"
      redirect_to '/signins/index'
    end
  end
end
