class AddBannerUrLtoStreams < ActiveRecord::Migration
  def change
    add_column :streams, :banner_url, :string
  end
end
