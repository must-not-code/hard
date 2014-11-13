ActiveAdmin.register Stream do
  permit_params :streamer, :channel

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

  form do |f|
    f.inputs do
      f.input :streamer
      f.input :channel
    end
    f.actions
  end
end
