Rails.application.routes.draw do
  # deviseのカスタマイズ
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # homeコントローラー
  get 'bookshelf' => "home#top"
  root "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books do

    collection do
      get 'search'
    end
    resources :likes, only:[:create, :destroy]
  end
  
  resources :users, only: [:index]


# 場所が微妙だけどdeviseのスコープ範囲指定
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end