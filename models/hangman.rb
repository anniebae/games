class Hangman < ActiveRecord::Base
  belongs_to :user

  def guess_letter(letter)
    if self.word.include? letter
      state = self.game_status.dup
      self.word.chars.each_with_index do |word_letter, idx|
        if word_letter == letter
          state[idx] = letter
        end
      end
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

  def check_complete
    if self.word == self.game_status
      self.complete = true
    end
    self.complete
  end

end