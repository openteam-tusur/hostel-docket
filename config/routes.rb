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

  get '/search' => 'application#search'

  root :to => 'hostels#index'
end
