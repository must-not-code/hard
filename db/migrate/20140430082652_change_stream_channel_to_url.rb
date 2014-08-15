class ChangeStreamChannelToUrl < ActiveRecord::Migration
  change_table :streams do |t|
    t.rename :channel, :url
  end
end
