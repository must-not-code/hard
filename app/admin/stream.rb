ActiveAdmin.register Stream do
  permit_params :streamer, :channel, :banner

  index do
    column :id
    column :streamer
    column :channel
    column :online
    column :views
    column :created_at
    column :updated_at

    actions
  end

  filter :streamer
  filter :channel
  filter :online, as: :check_boxes
  filter :created_at
  filter :updated_at

  show do |f|
    attributes_table do
      row :id
      row :streamer
      row :channel
      row :banner do
        image_tag(f.banner.url)
      end
      row :created_at
      row :updated_at
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :streamer
      f.input :channel
      f.input :banner, as: :file, hint: image_tag(object.banner.url)
    end
    f.actions
  end
end
