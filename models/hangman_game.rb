class Hangman < ActiveRecord::Base
  belongs_to :user

  def initialize
    @game_status = []
    @bad_guesses = []
    @incorrect = 0
    
  end


  def guess_letter(letter)
    idx = self.word.index(letter)
    if idx
      self.game_status[idx] = letter
    end
  end
end