Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles, only: [:index, :show]
  resources :topics, only: [:show] do
    resources :articles, only: [:index, :show]
  end


end
