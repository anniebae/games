require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
require_relative 'models/user'

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

    require 'CSV'

    conn = PG::Connection.open({dbname: 'games_db'})

    CSV.foreach('Random_Words.csv', :headers => true) do |row|
      word = row["Word"]

      sql_statement = <<-eos
        INSERT INTO words
          (word)
        VALUES
          ($1)
      eos

      conn.exec_params(sql_statement, [word])
    end
    conn.close
  end



  # desc "Add random words"
  # task :random_word do

  #   require './models/word'

  #   Word.create({word: "lemur"})
  #   Word.create({word: "elephant"})
  #   Word.create({word: "monkey"})
  # end


end