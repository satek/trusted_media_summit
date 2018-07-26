Rails.application.routes.draw do
  root to: 'visitors#index'

  match '/api/image', to: 'image_processing#index', via: :post
end
