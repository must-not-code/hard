class NewColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :vk, :string
    add_column :users, :fb, :string
    add_column :users, :site, :string
    add_column :users, :twitch, :string
    add_column :users, :twitter, :string

    create_table :teams do |t|
      t.string :title
      t.string :tag
      t.string :logo
      t.string :site
      t.string :vk
      t.string :fb
      t.string :youtube
      t.string :twitter
      t.timestamps
    end
  end
end
