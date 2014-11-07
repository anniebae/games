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
    # get the game by its ID 
    # game.update(params[:hangman])
    
    guessed_letter = params[:letter]
    object_to_return = {}    # ruby hash
    word = current_user.hangmen.last.word
    object_to_return[:letter] = guessed_letter
    if word.include? guessed_letter
      word.index(guessed_letter)
      object_to_return[:letter] = guessed_letter # {letter: 't'}
    end
    object_to_return.to_json  # {letter: 't'}.to_json => responds to request with JSON representation of hash
  end

end