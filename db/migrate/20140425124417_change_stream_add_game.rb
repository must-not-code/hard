class ChangeStreamAddGame < ActiveRecord::Migration
  change_table :streams do |t|
    t.string  :game
  end
end
