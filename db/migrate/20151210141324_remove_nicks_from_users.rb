class RemoveNicksFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :nick_ru
    remove_column :users, :nick_euw
  end
end
