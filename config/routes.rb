Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  
  resources :users, only:[:new, :create, :update,:edit]

  resources :ideas do 
   resources :likes, shallow: true, only: [:create, :destroy]

   resources :reviews, only: [:create, :destroy]
  end
  root 'ideas#index'
end
