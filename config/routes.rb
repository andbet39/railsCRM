Rails.application.routes.draw do
  resources :channels
  get 'pickup_booking/index'

  post 'pickup_booking/check'

  get 'pickup_booking/confirm'

  get 'pickup_booking/view'

  resources :pickups
  get 'customer/index'

  get 'customer/extract'

  get 'reservation/index'

  get 'reservation/view'
  get 'reservation/today'
  get 'reservation/checkinmail'

  get 'expedia_collect/index'
  get 'expedia_collect/view'

  get 'wubook/index'

  get 'wubook/acquire'
  get 'wubook/fetch_reservation'
  get 'wubook/fetch_new_reservation'
  get 'wubook/fetch_all_reservation'
  get 'wubook/fetch_rooms'
  get 'wubook/viewreservations'

  get 'import/index'

  get 'import/csv'
  post 'import/csv'

  resources :wb_csv_lines
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'wubook#viewreservation'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  namespace :api do
    resources :rooms
    resources :reservations
  end
  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
