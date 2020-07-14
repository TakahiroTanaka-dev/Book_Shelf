Rails.application.routes.draw do
  devise_for :users
  get 'bookshelf' => "home#top"
  root "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
end