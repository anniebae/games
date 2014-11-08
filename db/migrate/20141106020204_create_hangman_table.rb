class CreateHangmanTable < ActiveRecord::Migration
  def change
    create_table :hangman do |t|
      t.string :word
      t.boolean :complete, default: false
      t.references :user
      t.string :game_status, default: ""
      t.string :bad_guesses, default: ""

      t.timestamps
    end
  end
end
