Nameface::Application.routes.draw do

resources :users, :except => [:destroy]
resource :session, :only => [:new, :create, :destroy]

resources :events do  
  collection do 
    get 'add_event_to_user'
    get 'remove_event_from_user'
  end 
end 

root :to => 'pages#index'
get '/auth/:provider/callback', to: 'sessions#create'

end
