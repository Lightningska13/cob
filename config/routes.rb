Cob::Application.routes.draw do
  resources :animals

  mount Ckeditor::Engine => '/ckeditor'

	resources "users"
  
  resources "user_sessions"
  
  resources "events"
  
  resources :departments do
    collection do 
      post :sort
    end
    resources :contacts
  end
  
  resources :resources do
    collection do 
      post :sort
    end
  end
  
  resources "rescats"
  
  match 'new_contact' =>  'contact_us#new', :conditions => { :method => :get }
  resources :contact_us, :only => [:new, :create]

  resources :faqs do
    collection do
      post :sort
    end
  end

  resources "faq_categories"
  
  resources "showcase_medias"
  resources "showcase_images"
  
  resources :showcases do
    collection do 
      post :sort
    end
    resources :showcase_images
    resources :showcase_medias
  end

  	match 'login' => "user_sessions#new",      :as => :login
  	match 'logout' => "user_sessions#destroy", :as => :logout
	  
	  #add root def (will usually change this to "dash" later
	  #will need to remove index.html to see this
	 	root :to => "dash#index"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
