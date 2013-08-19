Pflegetester::Application.routes.draw do
  # resources :users
  # resources :sessions, only: [:new, :create, :destroy]

  # Static
  root  'static_pages#start'
  get "/start"              => 'static_pages#start'
  get "/hilfe"              => 'static_pages#hilfe'
  get "/kontakt"            => 'static_pages#kontakt'
  get "/impressum"          => 'static_pages#impressum'

  # Benutzer
  get "/registrieren"       => 'users#new'
  get "/benutzer/:id"       => 'users#show',  as: :user
  get "/benutzer"           => 'users#index', as: :users
  post "/benutzer"           => 'users#create'
  match "/benutzer/:id/bearbeiten", to: 'users#edit',   via: 'get',   as: :edit_user
  match "/benutzer/:id",            to: 'users#update', via: 'patch', as: :patch_user
  match "/benutzer/:id",            to: 'users#destroy', via: 'delete'

  # Sessions
  match '/anmelden',  to: 'sessions#new',         via: 'get'
  match '/anmelden',  to: 'sessions#create',      via: 'post'  
  match '/abmelden',  to: 'sessions#destroy',     via: 'delete'

  # Pflegeberater
  match '/pflegeberater',   to: 'pflegeberater#index', via: 'get'
  match '/pflegeberater',   to: 'pflegeberater#show', via: 'get', as: :pflegeberater_show

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
