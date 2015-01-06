require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
require_relative 'models/user'
require_relative 'models/word'

namespace :db do
  require_relative 'connection'

  desc "Create games_db database"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE games_db;')
    conn.close
  end

  desc "Drop games_db database"
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE games_db;')
    conn.close
  end

  desc "seed database with random_words_list"
  task :load_data do

    require 'csv'
    CSV.foreach('Random_Words.csv', headers: true) do |row|
      Word.create(word: row['Word'])
    end
    
  end

end

namespace :sin do
  desc "db console"
  task :console do
    require './models/user'
    require './models/word'
    require './models/hangman'
  end
end