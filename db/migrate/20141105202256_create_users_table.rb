class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user, null: false
      t.string :password_hash, null: false
      t.string :avatar

      t.timestamps
    end
  end
end
