class Hangman < ActiveRecord::Base
  belongs_to :user


  def guess_letter(letter)

    letter.upcase!
    total_lives = 9
    guess_number = 0
    g = guess.last

    idx = self.word.index(letter) # set variable 'idx' to find index of letter
    if idx
      self.game_status[idx] = letter
      game_status << letter       # add letter to game_status column
    else

      bad_guesses += letter       # add letter to bad_guesses column
    end
    
    self.save

  end



# player has nine lives
# remove a life after every bad guess



  def game_state
    game_state = self.word.gsub(/\w/, " ").chars
    game_state_arr = [].self.word.length


    # ***************** TO DO **********************
    # find out length of word.. substitute with " "
    # use regex to figure out how to select every letter of word
    # new array with specified length
  end


end