class ProfilesController < ApplicationController
  get '/' do
    @users = User.all
    if session[:current_user]
      @user = User.find(session[:current_user])
      games = @user.hangmen
      @num_wins = (games.select {|g| g.complete }).count
      @num_lose = (games.reject {|g| g.complete }).count
      erb :'profiles/index'
    else
      redirect '/'
    end
  end
end