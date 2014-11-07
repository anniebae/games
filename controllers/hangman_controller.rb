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
    guessed_letter = params[:letter]
    object_to_return = {}
    word = current_user.hangmen.last.word
    if word.include? guessed_letter
      word.index(guessed_letter)
      object_to_return[:letter] = guessed_letter
    end
    object_to_return.to_json
  end

end