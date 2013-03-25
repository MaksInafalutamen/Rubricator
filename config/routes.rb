Rubricator::Application.routes.draw do
  

  root :to => "rubricator#index"

  post "rubricator/create_rubric" => "rubricator#create_rubric"
  delete  "rubricator/del_rubric/:r" => "rubricator#del_rubric"
  post "rubricator/create_subrubric" => "rubricator#create_subrubric"
  delete  "rubricator/del_subrubric/:sr" => "rubricator#del_subrubric"
  post "rubricator/create_company" => "rubricator#create_company"
  delete  "rubricator/del_company/:id" => "rubricator#del_company"
  get  "rubricator/show_company/:id" => "rubricator#show_company"
  get  "rubricator/show_subrubric/:sr" => "rubricator#show_subrubric"
  get  "rubricator/show_rubric/:r" => "rubricator#show_rubric"
  post "rubricator/search" => "rubricator#search"
  resources :rubricator

  get "users/new" => "users#new"
  post "users/create" => "users#create"
  post "users/signin" => "users#signin"
  get "users/error" => "users#error"
  get "users/signout"

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
