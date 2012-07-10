CcsmCmsbizmass::Application.routes.draw do

  resources :categories

  devise_for :users

  scope "/manage" do
    resources :enterprises
    resources :records 
    get "/contact"=>"records#contact_show"   
    get "/editcontact"=>"records#contact_edit"   
    put "/updatecontact"=>"contacts#update" 
  end

  
   get "/index"=>"common/maps#show"
   get "/news"=>"common/maps#show"
   get "/maps"=>"common/maps#show"
   get "/magazines"=>"common/maps#show"
   get "/actions"=>"common/maps#show"
   get "/business"=>"common/maps#show"
   get "/service"=>"common/maps#show"
   get "/members"=>"common/maps#show"
   get "/contact"=>"common/contact#show"
  

  #map下的ajax
  get "/enterprises_by_city"=>"common/maps#get_ents_by_city_ajax"
  get "/enter_groups_by_city"=>"common/maps#get_ent_groups_by_city_ajax"
  get "/stores_by_ent_in_city"=>"common/maps#get_stores_by_ent_ajax"
  get "/ents_by_kind_in_city"=>"common/maps#get_ents_by_kind_ajax"
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
   root :to => 'common/maps#show'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
