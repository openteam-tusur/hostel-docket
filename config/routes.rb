HostelDocket::Application.routes.draw do
  resources :points, :except => [:show] do
    get 'search', :on => :collection
  end
  resources :hostels, :only => [:index, :show] do
    resources :rooms, :only => [:show] do
      resources :roomers, :only => [:show] do
        resources :records, :except => [:index, :show]
      end
    end
  end
  resources :permissions, :except => [:show]

  get '/search' => 'application#search'

  root :to => 'application#index'
end
