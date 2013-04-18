Nameface::Application.routes.draw do

resources :games #remove later if not in use

resources :users, :except => [:destroy]
resource :session, :only => [:new, :create, :destroy]

resources :events do 
  collection do 
    get 'add_event_to_user'
    get 'remove_event_from_user'
  end 
end 

root :to => 'users#index'


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
