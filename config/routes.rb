HostelDocket::Application.routes.draw do
  resources :points
  resources :hostels, :only => [:index, :show] do
    resources :rooms, :only => [:show] do
      resources :roomers, :only => [:show]
    end
  end

  root :to => 'hostels#index'
end
