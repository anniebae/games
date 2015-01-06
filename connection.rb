ActiveRecord::Base.establish_connection(
    ENV['DATABASE_URL'] || 'postgres://localhost/games_db'
  )