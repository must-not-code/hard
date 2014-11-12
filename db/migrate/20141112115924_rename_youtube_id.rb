class RenameYoutubeId < ActiveRecord::Migration
  def change
    change_table :videos do |t|
      t.rename :youtube_id, :youtube_hash
    end
  end
end
