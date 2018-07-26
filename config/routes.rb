Rails.application.routes.draw do
  root to: 'visitors#index'

  match '/api/image', to: 'image_processing#index', via: [:options, :post]
end
