ActiveAdmin.register Event do
  permit_params :start_at, :hr_score, :enemy_score,
                :country, :enemy, :tourney, :link

  index do
    column :start_at
    column :hr_score
    column :enemy_score
    column :country
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
      f.input :country, priority_countries: %w(RU UA BY), prompt: 'Выберите страну'
      f.input :enemy
      f.input :tourney
      f.input :link
    end
    f.actions
  end
end
