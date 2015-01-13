class RenameFlagToCountry < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.rename :flag, :country
    end
  end
end
