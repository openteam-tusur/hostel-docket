HostelDocket::Application.routes.draw do
  resources :points, :except => [:show] do
    get 'search', :on => :collection
  end
  resources :hostels, :only => [:index, :show] do
    resources :rooms, :only => [:show] do
      resources :roomers, :only => [:show] do
        resource :roomer_permission, :except => [:index, :show, :edit, :update]
        resources :records, :except => [:index, :show] do
          put :restore, :on => :member
        end
      end
    end
  end
  resources :permissions, :except => [:show, :edit, :update]
  resources :users, :only => [:index]

  get '/stats' => 'statistics#search', :as => :stats

  get '/search' => 'application#search'

  get '/my_stats' => 'application#my_stats'

  mount API => '/'

  root :to => 'application#index'
end
