ActiveAdmin.register Member do
  permit_params :name, :nickname, :role, :birthday, :location, :photo, :vk, :twitch, :status, :position, :crew

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

  form do |f|
    f.inputs do
      f.input :crew
      f.input :name
      f.input :nickname
      f.input :role
      f.input :birthday
      f.input :location
      f.input :photo
      f.input :vk
      f.input :twitch
      f.input :status
      f.input :position
    end
    f.actions
  end
end
