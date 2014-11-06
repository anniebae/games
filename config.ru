require 'bundler'
Bundler.require(:default)

Dir.glob('./{models,helpers,controllers}/*.rb').each do |file|
	require file
	puts "required #{file}"
end

map('/'){ run ApplicationController }
map('/users'){ run UsersController }
map('/sessions'){ run SessionsController }
map('/profiles'){ run ProfilesController }
map('/hangman'){ run HangmanController }
map('/tictactoe'){ run TicTacToeController }