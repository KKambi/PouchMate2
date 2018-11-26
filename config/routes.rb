Rails.application.routes.draw do



  # 유저 라우팅
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'cosmetics#table'
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



  # 알림 라우팅 
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end





  # 화장품 라우팅
  # 화장품 카테고리 관련 라우팅
  resources :cosmetics, except: [:index] do
    collection do
      get 'search'
      get 'search_result'
      get 'feed'
    end

    member do
      get :get_middle_categories, defaults: { format: "js" }
      get :get_small_categories, defaults: { format: "js" }
    end 
  end
    
  #댓글 라우팅 다은
  post '/cosmetics/:user_id/comment/create' => 'cosmetics#commentcreate', as: 'index_comment'
  delete '/cosmetics/:user_id/comment/:comment_id/create' => 'cosmetics#commentdestroy', as: 'comment_destroy'

  # 화장대 생성 관련 라우팅
  resources :carousels, only: [:new, :create, :edit, :update, :destroy] do
  end

  # 타인의 화장대 들어가는 라우팅

  get '/cosmetics/tables/:user_id' => 'cosmetics#table', as: 'table_cosmetic'


  # 인생템(Best) 관련 라우팅
  post 'bests/:cosmetic_id' => 'bests#best_toggle', as: 'toggle_bests'



end