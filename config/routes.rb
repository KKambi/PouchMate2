Rails.application.routes.draw do
  root 'cosmetics#index' 

  devise_for :users

	resources :cosmetics, except: [:index]
  
  get '/cosmetics/users/:user_id' => 'cosmetics#index', as: 'index_cosmetic'
end
