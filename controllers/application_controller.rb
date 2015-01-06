require 'sinatra/base'

class ApplicationController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper
  helpers ActiveSupport::Inflector

  ActiveRecord::Base.establish_connection(
    ENV['DATABASE_URL'] || 'postgres://localhost/games_db'
  )

  set :public_folder, File.expand_path('../../public', __FILE__)
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions, :method_override

  register Sinatra::ActiveRecordExtension

  get '/' do
    if current_user
      @user = User.find(session[:current_user])
      erb :authenticated
    else
      erb :not_authenticated
    end
  end

end