Hard::Application.routes.draw do
  root 'posts#index'

  controller :sessions do
    get  'login'                  => :new,             as: 'login'
    post 'login'                  => :create
    get  'logout'                 => :destroy,         as: 'logout'
  end

  controller :users do
    get  'signup'                 => :new,             as: 'signup'
    post 'users'                  => :create
    get  'top'                    => :top,             as: 'top'
    get  'users/:username'        => :show,            as: 'user'
    get  'users/:username/edit'   => :edit,            as: 'edit_user'
    put  'users/:username'        => :update
    post 'users/:username/avatar' => :avatar,          as: 'user_avatar'
    get  'users/:id/activate'     => :activate,        as: 'activate_user'
    get  'change_password'        => :change_password, as: 'change_password'
    put  'change_password'        => :update_password, as: 'update_password'
  end

  controller :tournaments, path: '/tournaments', as: 'tournament'  do
    get  ':id/list'               => :list,            as: 'list'
    get  ':id/groups'             => :groups,          as: 'groups'
    get  ':id/bracket'            => :bracket,         as: 'bracket'
    get  ':id/results'            => :results,         as: 'results'
    post ':id/signup'             => :signup,          as: 'signup'
    post ':id/signout'            => :signout,         as: 'signout'
    post ':id/checkin'            => :checkin,         as: 'checkin'
    get  ':id/standings'          => :grid,            as: 'grid'
    post ':id/standings'          => :standings,       as: 'standings'
    post ':id/shuffle'            => :shuffle,         as: 'shuffle'
  end

  controller :teams, path: '/teams' do
    get  '/'                      => :index,           as: 'teams'
    get  ':game'                  => :show,            as: 'team'
  end

  get  'rules'                    => 'rules#index',    as: 'rules'

  get  'password_reset'           => 'password_resets#new', as: 'new_password_reset'

  controller :posts, path: '/posts' do
    post 'save'                   => :save,            as: 'post_save'
    post 'upload'                 => :upload
  end

  resources :posts do
    get 'page/:page', action: :index, on: :collection
  end

  resources :comments
  resources :results
  resources :tournaments
  resources :password_resets
end
