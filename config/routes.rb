Hard::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    root 'posts#index'

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

    controller :tournaments, path: '/tournaments', as: 'tournament'  do
      get  'top'                => :top,             as: 'top'
      get  ':id/list'           => :list,            as: 'list'
      get  ':id/groups'         => :groups,          as: 'groups'
      post ':id/groups'         => :update_groups,   as: 'update_groups'
      get  ':id/bracket'        => :bracket,         as: 'bracket'
      get  ':id/rules'          => :rules,           as: 'rules'
      get  ':id/results'        => :results,         as: 'results'
      post ':id/signup'         => :signup,          as: 'signup'
      post ':id/signout'        => :signout,         as: 'signout'
      post ':id/checkin'        => :checkin,         as: 'checkin'
      get  ':id/standings'      => :grid,            as: 'grid'
      post ':id/standings'      => :standings,       as: 'standings'
      post ':id/shuffle'        => :shuffle,         as: 'shuffle'
    end

    resources :posts, only: [:index, :show] do
      get 'page/:page', action: :index, on: :collection
    end

    resources :videos, only: [:index, :show] do
      get 'page/:page', action: :index, on: :collection
    end

    resources :teams, id: /.*/ do
      post 'leave'              => 'teams#leave',    as: 'leave'
      resources :invites, only: [:new, :create, :destroy]
    end

    resources :users, except: [:destroy] do
      resources :invites, only: [:index]
    end

    resources :crews, only: [:index, :show], param: :game
    resources :streams, only: [:index, :show]
    resources :comments, only: [:create, :destroy]
    resources :post_attachments, only: [:create, :destroy]
    resources :results, only: [:create]
    resources :tournaments
    resources :password_resets, except: [:index, :show, :destroy], path_names: { new: '' }

    ActiveAdmin.routes(self)
  end
end
