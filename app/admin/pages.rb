ActiveAdmin.register Page do
  permit_params :title, :content_ru, :content_en

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
      row (:content_ru) { |x| x.content_ru.html_safe if x.content_ru }
      row (:content_en) { |x| x.content_en.html_safe if x.content_en }
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :content_ru
      f.input :content_en
    end
    f.actions
  end
end
