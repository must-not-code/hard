class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :reward
      t.string :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
