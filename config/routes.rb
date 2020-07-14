Rails.application.routes.draw do
  devise_for :users
  get 'bookshelf' => "home#top"
  root "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:index]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end