ActiveAdmin.register Team do
  permit_params :game, :title, :logo

  index do
    column :id
    column :game
    column :title
    column :created_at
    column :updated_at

    actions
  end

  filter :game
  filter :title
  filter :created_at
  filter :updated_at

  show do |f|
    attributes_table do
      row :id
      row :game
      row :title
      row(:logo) { image_tag(f.logo.url) }
      row :created_at
      row :updated_at
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :game
      f.input :title
      f.input :logo, as: :file, hint: image_tag(object.logo.url)
    end
    f.actions
  end
end
