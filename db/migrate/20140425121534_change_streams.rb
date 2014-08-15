class ChangeStreams < ActiveRecord::Migration
  change_table :streams do |t|
    t.remove  :top_stream
    t.remove  :our_stream
    t.string  :streamer
    t.integer :views
    t.boolean :online
  end
end
