class ChangeStringsLimit < ActiveRecord::Migration
  def change
    change_column :kinds, :kind, :string, :limit => nil
    change_column :posts, :title, :string, :limit => nil
    change_column :posts, :game, :string, :limit => nil
    change_column :tournaments, :title, :string, :limit => nil
    change_column :users, :username, :string, :limit => nil
    change_column :users, :crypted_password, :string, :limit => nil
    change_column :users, :email, :string, :limit => nil
    change_column :users, :avatar, :string, :limit => nil
    change_column :users, :tag, :string, :limit => nil
    change_column :users, :skype, :string, :limit => nil
  end
end
