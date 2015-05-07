Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :exports, only: [:index,:create], module: :products
  end
end
