class CreateAmkAuthenticationSessions < ActiveRecord::Migration
  def change
    create_table :amk_authentication_sessions do |t|
      t.string :uuid
      t.integer :user_id
      t.string :ip_address
      t.text :user_agent
      t.datetime :last_accessed_at
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :amk_authentication_sessions , :uuid
  end
end
