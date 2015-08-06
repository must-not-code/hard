ActiveAdmin.register Carousel do
  permit_params :title, :url, :position, :image

  index do
    column :id
    column :title
    column :url
    column :position
    column :created_at
    column :updated_at

    actions
  end

  filter :title
  filter :url
  filter :position
  filter :created_at
  filter :updated_at

  show do |f|
    attributes_table do
      row :title
      row :url
      row :position
      row :image do
        image_tag(f.image.url)
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :title
      f.input :url
      f.input :position
      f.input :image, as: :file, hint: image_tag(object.image.url)
    end
    f.actions
  end
end
