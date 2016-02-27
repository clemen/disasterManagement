class CreateUserInfo < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :salt
    end
  end
end
