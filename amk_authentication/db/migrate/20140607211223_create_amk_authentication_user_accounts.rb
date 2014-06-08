class CreateAmkAuthenticationUserAccounts < ActiveRecord::Migration
  def change
    create_table :amk_authentication_user_accounts do |t|
      t.string :email
      t.string :hashed_password
      t.string :password_salt
      t.string :display_name

      t.timestamps
    end

    add_index :amk_authentication_user_accounts , :email
  end
end
