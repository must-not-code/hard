Hard::Application.routes.draw do
  root 'posts#index'

  controller :sessions do
    get  'login'                  => :new,             as: 'login'
    post 'login'                  => :create
    get  'logout'                 => :destroy,         as: 'logout'
  end

  controller :users do
    get  'signup'                 => :new,             as: 'signup'
    patch  'users/:username'                 => :update
    get  'users/:username'        => :show,            as: 'user'
    get  'users/:username/edit'   => :edit,            as: 'edit_user'
    put  'users/:username'        => :update
    get  'users/:id/activate'     => :activate,        as: 'activate_user'
    get  'change_password'        => :change_password, as: 'change_password'
    put  'change_password'        => :update_password, as: 'update_password'
  end

  controller :tournaments, path: '/tournaments', as: 'tournament'  do
    get  'top'                    => :top,             as: 'top'
    get  ':id/list'               => :list,            as: 'list'
    get  ':id/groups'             => :groups,          as: 'groups'
    post ':id/groups'             => :update_groups,   as: 'update_groups'
    get  ':id/bracket'            => :bracket,         as: 'bracket'
    get  ':id/rules'              => :rules,           as: 'rules'
    get  ':id/results'            => :results,         as: 'results'
    post ':id/signup'             => :signup,          as: 'signup'
    post ':id/signout'            => :signout,         as: 'signout'
    post ':id/checkin'            => :checkin,         as: 'checkin'
    get  ':id/standings'          => :grid,            as: 'grid'
    post ':id/standings'          => :standings,       as: 'standings'
    post ':id/shuffle'            => :shuffle,         as: 'shuffle'
  end

  controller :crews, path: '/crews' do
    #get  '/'                      => :index,           as: 'crews'
    get  '/', to: redirect('/crews/lol'),              as: 'crews'
    get  ':game'                  => :show,            as: 'crew'
  end

  controller :posts, path: '/posts', as: 'post' do
    post 'save'                   => :save,            as: 'save'
    post 'upload'                 => :upload,          as: 'upload'
  end

  resources :posts do
    get 'page/:page', action: :index, on: :collection
  end

  resources :videos do
    get 'page/:page', action: :index, on: :collection
  end

  get  'password_reset'           => 'password_resets#new', as: 'new_password_reset'

  resources :users
  resources :streams
  resources :comments
  resources :results
  resources :tournaments
  resources :password_resets

  ActiveAdmin.routes(self)
end
