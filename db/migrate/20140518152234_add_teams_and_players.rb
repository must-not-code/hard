class AddTeamsAndPlayers < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :game
      t.string :title
      t.string :logo
      t.timestamps
    end

    create_table :members do |t|
      t.string :name
      t.string :nickname
      t.string :role
      t.string :photo
      t.belongs_to :team
      t.timestamps
    end
  end
end
