class HangmanGame < ActiveRecord::Base
  def guess_letter(letter)
    idx = self.word.index(letter)
    if idx
      self.game_status[idx] = letter
    end
  end
end