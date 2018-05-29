Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'users#index'
  resources :criterias
  resources :answers, only:[:create, :show] do
    resources :conversations, only: :create
  end
  resources :conversations, only: :show do
    resources :messages, only: :create
  end
  delete '/logout' => 'registrations#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
