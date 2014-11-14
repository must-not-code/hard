ActiveAdmin.register Tournament do
  permit_params :title, :show, :content, :beginning, :sign_up_end, :check_in, :check_in_end, :seats, :passing_score, :skip_consolation_round, :skip_secondary_final, :standings, :groups

  hstore_editor

  index do
    column :id
    column :title
    column :show
    column :content
    column :beginning
    column :sign_up_end
    column :check_in
    column :check_in_end
    column :seats
    column :passing_score
    column :skip_consolation_round
    column :skip_secondary_final
    column :standings
    column :groups
    column :created_at
    column :updated_at

    actions
  end

  filter :title
  filter :show, as: :check_boxes
  filter :content
  filter :beginning
  filter :seats
  filter :passing_score
  filter :skip_consolation_round, as: :check_boxes
  filter :skip_secondary_final, as: :check_boxes
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :show
      f.input :content, input_html: {class: 'tinymce'}
      f.input :beginning
      f.input :sign_up_end
      f.input :check_in
      f.input :check_in_end
      f.input :seats
      f.input :passing_score
      f.input :skip_consolation_round
      f.input :skip_secondary_final
      f.input :standings, as: :hstore
      f.input :groups, as: :hstore
    end

    f.actions
  end
end
