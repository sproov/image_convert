ImageConvert::Application.routes.draw do

  resources :images, only: [:index, :create, :show]

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'images#index'
end
