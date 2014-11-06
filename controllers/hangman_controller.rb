class HangmanController < ApplicationController
  get '/' do
    erb :'hangman/index'
  end

  get '/word' do
    words = Word.all
    sample_word = words.sample[:word]
    sample_word.to_json
  end
end