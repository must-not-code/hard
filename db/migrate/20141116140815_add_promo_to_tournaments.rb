class AddPromoToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :promo, :text
    add_column :tournaments, :rules, :text
  end
end
