class RemoveGameAndUrlFromStreams < ActiveRecord::Migration
  def change
    remove_column :streams, :game
    remove_column :streams, :url
  end
end
