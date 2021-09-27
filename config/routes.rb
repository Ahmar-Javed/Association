Rails.application.routes.draw do

  resources :users
 resources :suppliers  do
   resources :accounts do
    resource :account_histories
  end
  end

  resources :patients do
    resources :appointments
  end

  resources :physicians do 
    resources :appointments
  end
 end

