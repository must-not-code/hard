class AddMemberVKandTwitch < ActiveRecord::Migration
  change_table :members do |t|
    t.string :vk
    t.string :twitch
  end
end
