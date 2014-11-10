class HangmanController < ApplicationController

  get '/' do
    erb :'hangman/index'
  end

  get '/word' do
    authenticate!
    word = Word.all.sample.word
    hangman = Hangman.create({
      user_id: current_user.id, 
      word: word,
      game_status: ("_")*word.length,
      })
    word.to_json
  end

  patch '/guess_letter' do
    authenticate!
    guessed_letter = params[:letter]
    game = current_user.hangmen.last
    word = game.word
    if word.include? guessed_letter
      game.guess_letter(guessed_letter)
    else
      game.bad_guesses += guessed_letter
    end
    game.check_complete
    game.save
    {
      word: game.word,
      letter: guessed_letter,
      game_status: game.game_status,
      bad_guesses: game.bad_guesses,
      lives: (5 - game.bad_guesses.length),
      complete: game.game_status == game.word
    }.to_json
  end

  get '/cat_mouse' do
    game = current_user.hangmen.last
    {
      image: game.cat_mouse
    }.to_json
  end

end