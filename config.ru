require 'bundler'
Bundler.require(:default)

require './controllers/application_controller'
require './controllers/hangman_controller'
require './controllers/profiles_controller'
require './controllers/sessions_controller'
require './controllers/users_controller'

require './helpers/authentication_helper'

require './models/hangman'
require './models/user'
require './models/word'

map('/'){ run ApplicationController }
map('/users'){ run UsersController }
map('/sessions'){ run SessionsController }
map('/profiles'){ run ProfilesController }
map('/hangman'){ run HangmanController }