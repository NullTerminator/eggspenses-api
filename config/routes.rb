Rails.application.routes.draw do
  resources :assets
  resources :asset_events
  resources :expenses
  resources :products
  resources :productions
  resources :sale_items
end
