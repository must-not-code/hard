class AddNicksTOuser < ActiveRecord::Migration
  def change
    add_column :users, :nick_ru, :string
    add_column :users, :nick_euw, :string
  end
end
