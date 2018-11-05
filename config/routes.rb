Rails.application.routes.draw do

	# 메인화면 루트 라우팅
  root 'cosmetics#main' 
  


  # 친구 요청 관리 라우팅
  resources :friend_requests, except: [:index, :show, :edit]
  
  # 친구 관리 라우팅
  get 'friends/index'
  delete 'friends/destroy/:id' => 'friends#destroy', :as => 'friends_destroy'


  # 유저 라우팅
  devise_for :users



  # 화장대 및 화장품 라우팅
	resources :cosmetics, except: [:index] do
    collection do
      get 'mypage'
    end 
  end

  get '/cosmetics/tables/:user_id' => 'cosmetics#table', as: 'table_cosmetic'
end
