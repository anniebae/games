class Hangman < ActiveRecord::Base
  belongs_to :user

  def initialize
    @game_status = []
    @bad_guesses = []
    @incorrect = 0
    @word = Word.all.sample.word
  end

  def guess_letter(letter)
    letter.upcase!
    idx = self.word.index(letter)
    if idx
      self.game_status[idx] = letter
    end
  end

  def game_state
    game_state = self.word.gsub(/\w/, " ").chars 

    # find out length of word.. substitute with " "
    # use regex to figure out how to select every letter of word

  end


end