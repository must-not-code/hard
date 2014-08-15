class AddChannel < ActiveRecord::Migration
  change_table :streams do |t|
    t.string :channel
  end
end
