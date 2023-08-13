Rails.application.routes.draw do
  root "static_pages#top"
  resources :users, only: %i[new create]
  resources :boards, only: %i[index new create show] do
    resources :comments, only: %i[create edit destroy], shallow: true
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
