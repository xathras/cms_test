class CreateAmkAuthenticationCredentials < ActiveRecord::Migration
  def change
    create_table :amk_authentication_credentials do |t|
      t.string :email
      t.string :hashed_password
      t.string :password_salt

      t.timestamps
    end

    add_index :amk_authentication_credentials , :email
  end
end
