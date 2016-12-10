class UsersController < ApplicationController
  def index
  end

  def create
    name = params[:name]
    address = params[:address]
    city = params[:city]
    state = params[:state]
    zip = params[:zip]
    country = params[:country]
    email = params[:email]
    userid = params[:userid]
    password = params[:password]
    @user = User.new(name,address,city,state,zip,country,email,userid,password)
    session[:user] = @user.to_yaml
    redirect_to '/signins/index'
  end
end
