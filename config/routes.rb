Rails.application.routes.draw do

  root to: "funastars#top"
  resources :contacts
  resources :funastars do
    collection do
      post :confirm
      get :favorites_index
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy, :show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
