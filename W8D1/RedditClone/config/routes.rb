Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :index, :show, :update, :edit] 

  resources :subs do
    resources :posts, only: [:new, :create]
  end
  resources :posts, only: [:show, :update, :edit, :destroy]

end
