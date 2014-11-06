require 'sinatra/base'

class ApplicationController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper
  helpers ActiveSupport::Inflector
  ActiveRecord::Base.establish_connection({
    adapter: 'postgresql',
    database: 'games_db'
    })

  set :public_folder, File.expand_path('../../public', __FILE__)
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions, :method_override

  register Sinatra::ActiveRecordExtension

  get '/' do
    if current_user
      erb :authenticated
    else
      erb :not_authenticated
    end
  end

end