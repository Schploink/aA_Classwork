Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :index, :show, :update, :edit] do 
    resources :posts, only: [:edit, :update]
  end
  resources :subs
  resources :posts, only: [:create, :new, :show, :update, :edit, :destroy]
  resources :posts do
    resources :users, only: [:edit, :update]
  end
end
