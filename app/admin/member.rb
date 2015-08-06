ActiveAdmin.register Member do
  permit_params :name, :nickname, :role, :birthday, :country, :city, :photo, :vk, :twitch, :status, :position, :team_id, :mouse, :mouse_link, :keyboard, :keyboard_link, :headset, :headset_link, :pad, :pad_link

  index do
    column :id
    column :name
    column :nickname
    column :role
    column :created_at
    column :updated_at

    actions
  end

  filter :team
  filter :name
  filter :nickname
  filter :role
  filter :created_at
  filter :updated_at

  show do |f|
    attributes_table do
      row :team
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
      row :position
      row :mouse
      row :mouse_link
      row :keyboard
      row :keyboard_link
      row :headset
      row :headset_link
      row :pad
      row :pad_link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :team
      f.input :name
      f.input :nickname
      f.input :role
      f.input :photo, as: :file, hint: image_tag(object.photo.url)
      f.input :birthday, start_year: 1900, end_year: Time.zone.today.year
      f.input :country, priority_countries: %w(RU UA BY), prompt: 'Выберите страну'
      f.input :city
      f.input :vk
      f.input :twitch
      f.input :status
      f.input :position
      f.input :mouse
      f.input :mouse_link
      f.input :keyboard
      f.input :keyboard_link
      f.input :headset
      f.input :headset_link
      f.input :pad
      f.input :pad_link
    end
    f.actions
  end
end
