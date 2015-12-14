class RenameSomeUserColumns < ActiveRecord::Migration
  def change
    rename_column :users, :fb, :facebook
    rename_column :users, :site, :link
  end
end
