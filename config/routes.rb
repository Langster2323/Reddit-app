Rails.application.routes.draw do
  resources :votes
  resources :urls
  resources :links
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'links#index'
end
