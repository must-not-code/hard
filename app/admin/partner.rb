ActiveAdmin.register Partner do
  permit_params :title, :content_ru, :content_en, :logo,
                :site, :site_icon, :vk, :fb, :instagram

  index do
    column :id
    column :title
    column :created_at
    column :updated_at

    actions
  end

  filter :title
  filter :created_at
  filter :updated_at

  show do |f|
    attributes_table do
      row :title
      row :logo do
        image_tag(f.logo.url)
      end
      row(:content_ru) { |x| x.content_ru.html_safe if x.content_ru }
      row(:content_en) { |x| x.content_en.html_safe if x.content_en }
      row :site
      row :site_icon do
        image_tag(f.site_icon.url)
      end
      row :vk
      row :fb
      row :instagram
    end
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :title
      f.input :logo, as: :file, hint: image_tag(object.logo.url)
      f.input :content_ru
      f.input :content_en
      f.input :site
      f.input :site_icon, as: :file, hint: image_tag(object.site_icon.url)
      f.input :vk
      f.input :fb
      f.input :instagram
    end
    f.actions
  end
end
