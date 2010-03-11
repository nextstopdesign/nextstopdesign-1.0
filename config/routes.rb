ActionController::Routing::Routes.draw do |map|

  map.resources :tickers
  map.resources :photos


  map.resources :ideas
  map.resources :designs
  map.resources :users, :collection => { 
                        :request_dob => :get, 
                        :verify_dob => :get, 
                        :minor_waiver => :get, 
                        :adult_waiver => :get,
                        :verification_sent => :get,
                        :verification_confirmed => :get,
                        :verification_failed => :get,
                        :complete => :get }
  
  map.resources :sessions,  :collection => {
                            :forgot => :get,
                            }
  map.resources :pages
  map.resources :ratings
  map.resources :comments
  map.resources :tickercontent
    
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  map.resources :welcome
  
  map.inspiration 'inspiration', :controller => 'photos', :action => 'index'
  map.learn 'learn', :controller => 'pages', :action => 'show', :permalink => 'learn'
  map.about 'about', :controller => 'pages', :action => 'show', :permalink => 'about'
  map.about 'about/site', :controller => 'pages', :action => 'show', :permalink => 'site'
  map.about 'about/tools', :controller => 'pages', :action => 'show', :permalink => 'tools'
  map.about 'about/considerations', :controller => 'pages', :action => 'show', :permalink => 'considerations'
  map.contact 'contact', :controller => 'pages', :action => 'show', :permalink => 'contact'
  map.press 'press', :controller => 'pages', :action => 'show', :permalink => 'press'
  map.privacy_policy 'privacy-policy', :controller => 'pages', :action => 'show', :permalink => 'privacy_policy'
  map.terms_of_use 'terms-of-use', :controller => 'pages', :action => 'show', :permalink => 'tou'
  map.ratings 'what-happened', :controller => 'pages', :action => 'show', :permalink => 'what-happened'

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "welcome"
  
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
