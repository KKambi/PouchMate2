Rails.application.routes.draw do


  # 유저 라우팅
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'cosmetics#mypage'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  


  # 친구 요청 관리 라우팅
  resources :friend_requests, except: [:index, :show, :edit]

  # 친구 관리 라우팅
  get 'friends/index'
  delete 'friends/destroy/:id' => 'friends#destroy', :as => 'friends_destroy'




  # 화장대 및 화장품 라우팅
	resources :cosmetics, except: [:index] do
    collection do
      get 'mypage'
      get 'search'
      get 'search_result'
      get 'feed'
    end 
  end

  get '/cosmetics/tables/:user_id' => 'cosmetics#table', as: 'table_cosmetic'
end
