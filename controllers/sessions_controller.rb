class SessionsController < ApplicationController
  get '/new' do
    erb :'sessions/new'
  end

  post '/' do
    user = User.find_by({username: params[:username]})
    if user
      if user.password == params[:password]
        session[:current_user] = user.id
        redirect '/profiles'
      else
        @error = "Wrong Password"
        redirect '/sessions/error'
      end
    else
      redirect '/users/new'
    end
  end

  get '/error' do
  @error = "** wrong password **"
  erb :'sessions/new'
  end

  delete '/' do
    session[:current_user] = nil
    redirect '/'
  end
end