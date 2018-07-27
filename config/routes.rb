Rails.application.routes.draw do
  root to: 'visitors#index'

  match '/api/image', to: 'image_processing#index', via: [:options, :post]
  match '/api/language_list', to: 'image_processing#language_list', via: [:get]
  match '/api/translate', to: 'image_processing#translate', via: [:post]
end
