class DefaultStandingsNil < ActiveRecord::Migration
  def change
    change_column :tournaments, :standings, :text, :default => nil
  end
end
