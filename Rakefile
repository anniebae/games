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

    require 'csv'

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

end

namespace :sin do
  desc "db console"
  task :console do
    require './models/user'
    require './models/word'
    require './models/hangman'
  end
end