class AddRememberToken < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :remember_token, :string
    add_index :users, :email
  end
end
