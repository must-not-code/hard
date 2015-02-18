ActiveAdmin.register Member do
  permit_params :name, :nickname, :role, :birthday, :country, :city, :photo, :vk, :twitch, :status, :position, :crew_id

  index do
    column :id
    column :name
    column :nickname
    column :role
    column :created_at
    column :updated_at

    actions
  end

  filter :crew
  filter :name
  filter :nickname
  filter :role
  filter :created_at
  filter :updated_at

  show do |f|
    attributes_table do
      row :crew
      row :name
      row :nickname
      row :role
      row :photo do
        image_tag(f.photo.url)
      end
      row :birthday
      row :country
      row :city
      row :vk
      row :twitch
      row :status
    end
  end

  form :html => { :multipart => true } do |f|
    f.inputs do
      f.input :crew
      f.input :name
      f.input :nickname
      f.input :role
      f.input :photo, :as => :file, :hint => image_tag(object.photo.url)
      f.input :photo_cache, :as => :hidden
      f.input :birthday, start_year: 1900, end_year: Date.today.year
      f.input :country, priority_countries: ['RU', 'UA', 'BY'], prompt: 'Выберите страну'
      f.input :city
      f.input :vk
      f.input :twitch
      f.input :status
      f.input :position
    end
    f.actions
  end
end
