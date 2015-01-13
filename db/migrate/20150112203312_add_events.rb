class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_at
      t.integer  :hr_score
      t.integer  :enemy_score
      t.string   :flag
      t.string   :enemy
      t.string   :tourney

      t.timestamps
    end
  end
end
