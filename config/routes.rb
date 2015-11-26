Hard::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    root 'home#index'

    controller :sessions do
      get  'login'              => :new,             as: 'login'
      post 'login'              => :create
      get  'logout'             => :destroy,         as: 'logout'
    end

    controller :users do
      get  'signup'             => :new,             as: 'signup'
      get  'users/:id/activate' => :activate,        as: 'activate_user'
      get  'users/:id/password' => :change_password, as: 'change_password'
      put  'users/:id/password' => :update_password, as: 'update_password'
    end

    resources :posts, only: [:index, :show] do
      get 'page/:page', action: :index, on: :collection
    end

    resources :videos, only: [:index, :show] do
      get 'page/:page', action: :index, on: :collection
    end

    resources :users, except: [:destroy]
    resources :teams, only: [:index, :show], param: :game
    resources :streams, only: [:index, :show]
    resources :comments, only: [:create, :destroy]
    resources :post_attachments, only: [:create, :destroy]
    resources :password_resets, except: [:index, :show, :destroy], path_names: { new: '' }
    resources :partners, only: [:index]

    get '/about' => 'pages#about'

    ActiveAdmin.routes(self)
  end
end
