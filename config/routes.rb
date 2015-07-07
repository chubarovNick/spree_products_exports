Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :exports, only: [:index,:create, :show], module: :products
  end
end
