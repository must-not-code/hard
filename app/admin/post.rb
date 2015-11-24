ActiveAdmin.register Post do
  permit_params :title, :user, :game, :content, :views, :preview, :published_at

  index do
    column :id
    column :title
    column :user
    column :views
    column :published_at
    column :created_at
    column :updated_at

    actions
  end

  filter :user_username, as: :string, label: 'User'
  filter :title
  filter :game
  filter :created_at
  filter :updated_at

  show do |f|
    attributes_table do
      row :id
      row :user
      row :title
      row :game
      row :views
      row :preview do
        image_tag(f.preview.url)
      end
      row (:content) { |x| x.content.html_safe if x.content }
      row :published_at
      row :created_at
      row :updated_at
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :title
      f.input :preview, as: :file, hint: image_tag(object.preview.url)
      f.input :game
      f.input :content
      f.input :views
      f.input :published_at
    end

    f.actions
  end

  member_action :publish, method: :get do
    resource.update(published_at: Time.zone.now)
    redirect_to resource_path, notice: 'Published!'
  end

  action_item(:publish, only: :edit) do
    unless resource.published_at
      link_to 'Publish', 'publish'
    end
  end

  controller do
    before_create do
      resource.user_id = current_user.id
    end

    before_filter do
      # Disabling this is probably not a good idea,
      # but the header causes Chrome to choke when being
      # redirected back after a submit and the page contains an iframe.
      response.headers['X-XSS-Protection'] = '0'
    end
  end
end
