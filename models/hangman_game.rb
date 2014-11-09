class Hangman < ActiveRecord::Base
  belongs_to :user

  def guess_letter(letter)
    idx = self.word.index(letter)
    if idx
      state = self.game_status.dup
      state[idx] = letter
      self.game_status = state
    else
      bad_guesses += letter
    end
    self.save
  end

  def game_state
    game_state = self.word.gsub(/\w/, " ").chars
    game_state_arr = [].self.word.length
  end

  def cat_mouse
    "images/#{bad_guesses.length + 1}.png"
  end

end