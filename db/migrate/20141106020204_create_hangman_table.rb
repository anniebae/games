class CreateHangmanTable < ActiveRecord::Migration
  def change
    create_table :hangman do |t|
      t.string :word
      t.boolean :complete
      t.references :user
      t.string :game_status
      t.string :bad_guesses

      t.timestamps
    end
  end
end
