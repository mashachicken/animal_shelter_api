Rails.application.routes.draw do
  resources :animals
  get '/random' => 'animals#random'
end
