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

match 'auth/:provider/callback', to: 'sessions#create'
match 'auth/failure', to: redirect('/')
match 'signout', to: 'sessions#destroy', as: 'signout'


end
