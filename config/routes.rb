Rails.application.routes.draw do  
  resources :categories do
    resources :tasks
  end
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_in' => 'devise/sessions#new'
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
