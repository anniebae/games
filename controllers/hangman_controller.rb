class HangmanController < ApplicationController
  get '/' do
    erb :'hangman/index'
  end

  get '/word' do
    authenticate!
    word = Word.all.sample.word

    hangman = Hangman.create(user_id: current_user.id, word: word)
    word.to_json
  end

  patch '/guess_letter' do
    authenticate!

  end
end