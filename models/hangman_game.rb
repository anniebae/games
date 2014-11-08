class Hangman < ActiveRecord::Base
  belongs_to :user


  def guess_letter(letter)

    idx = self.word.index(letter) # set variable 'idx' to find index of letter
    if idx
      state = self.game_status.dup
      state[idx] = letter
      self.game_status = state
    else
      bad_guesses += letter       # add letter to bad_guesses column
    end

    self.save

  end


  def game_state
    game_state = self.word.gsub(/\w/, " ").chars
    game_state_arr = [].self.word.length


    # ***************** TO DO **********************
    # find out length of word.. substitute with " "
    # use regex to figure out how to select every letter of word
    # new array with specified length
  end


end