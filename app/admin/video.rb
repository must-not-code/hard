ActiveAdmin.register Video do
  index do
    selectable_column
    column :id
    column :title
    column :youtube_hash
    column :created_at
    column :updated_at

    actions
  end
end
