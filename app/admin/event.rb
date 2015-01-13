ActiveAdmin.register Event do
  permit_params :start_at, :hr_score, :enemy_score, :flag, :enemy, :tourney

  index do
    column :start_at
    column :hr_score
    column :enemy_score
    column :flag
    column :enemy
    column :tourney

    actions
  end

  filter :start_at
  filter :enemy
  filter :tourney
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :start_at
      f.input :hr_score
      f.input :enemy_score
      f.input :flag, priority_countries: ['RU', 'UA', 'BY']
      f.input :enemy
      f.input :tourney
    end
    f.actions
  end
end
