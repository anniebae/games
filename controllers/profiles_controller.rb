class ProfilesController < ApplicationController
  get '/' do
    @users = User.all
    if session[:current_user]
      @user = User.find(session[:current_user])
      erb :'profiles/index'
    else
      redirect '/'
    end
  end
end