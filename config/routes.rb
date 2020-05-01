Rails.application.routes.draw do
  devise_for :users,:controllers => {
    :registrations => 'users/registrations'
   }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'tweets#index'
  resources :tweets, only: [:index, :new,:create,:show,:edit,:update,:destroy]
  resources :users, only: [:show]
end
