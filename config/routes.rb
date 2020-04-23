Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :tweets, only: [:index, :new]
end
