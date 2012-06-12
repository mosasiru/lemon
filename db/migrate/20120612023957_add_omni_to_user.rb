class AddOmniToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :bigint
    add_column :users, :name, :string
    add_column :users, :provider, :string
    add_column :users, :password, :string
  end
end
