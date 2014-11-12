ActiveAdmin.register Video do
  permit_params :title, :youtube_hash

  index do
    column :id
    column :title
    column :youtube_hash
    column :created_at
    column :updated_at

    actions
  end
end
