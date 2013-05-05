Nameface::Application.routes.draw do

resources :users, :except => [:destroy]
resource :session, :only => [:new, :create, :destroy]

# resources :events, :only => [:index, :show] do 
resources :events do  
  collection do 
    get 'add_event_to_user'
    get 'remove_event_from_user'
  end 
end 

# scope "/admin" do
# 	resources :events, only: [:new, :create, :edit, :update, :destroy] 
# end

root :to => 'pages#index'
get '/auth/:provider/callback', to: 'sessions#create'

end
