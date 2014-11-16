ActiveAdmin.register Tournament do
  permit_params :title, :show, :content, :beginning, :sign_up_end, :check_in, :check_in_end, :seats, :passing_score, :skip_consolation_round, :skip_secondary_final, :standings, :groups, :promo, :rules

  hstore_editor

  index do
    column :id
    column :title
    column :beginning
    column :created_at
    column :updated_at

    actions
  end

  filter :title
  filter :beginning
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :id
      row :title
      row (:content) {|foobar| foobar.content.html_safe if foobar.content}
      row (:promo) {|foobar| foobar.promo.html_safe if foobar.promo}
      row (:rules) {|foobar| foobar.rules.html_safe if foobar.rules}
      row :seats
      row :passing_score
      row :show
      row :skip_consolation_round
      row :skip_secondary_final
      row :beginning
      row :sign_up_end
      row :check_in
      row :check_in_end
      row :standings
      row :groups
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :promo
      f.input :rules
      f.input :seats
      f.input :passing_score
      f.input :show
      f.input :skip_consolation_round
      f.input :skip_secondary_final
      f.input :beginning
      f.input :sign_up_end
      f.input :check_in
      f.input :check_in_end
      f.input :standings, as: :hstore
      f.input :groups, as: :hstore
    end

    f.actions
  end
end
