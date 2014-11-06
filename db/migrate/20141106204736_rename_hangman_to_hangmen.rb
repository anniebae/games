class RenameHangmanToHangmen < ActiveRecord::Migration
  def change
    rename_table :hangman, :hangmen
  end
end
