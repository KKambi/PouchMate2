Rails.application.routes.draw do

  root 'cosmetics#index' 
  


  # 친구 요청 관리 라우팅
  resources :friend_requests
  
  # 친구 관리 라우팅
  get 'friends/index'
  delete 'friends/destroy/:id' => 'friends#destroy', :as => 'friends_destroy'


  devise_for :users




	resources :cosmetics, except: [:index]  
  get '/cosmetics/users/:user_id' => 'cosmetics#index', as: 'index_cosmetic'
end
