Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  # delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  mount ActionCable.server => "/cable"
  root to: 'users#index'
  resources :criterias
  resources :answers, only:[:create, :show] do
    resources :conversations, only: :create
  end
  resources :conversations, only: [:show, :index] do
    resources :messages, only: :create
  end
  delete '/logout' => 'registrations#destroy'
  get '/profile' => 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


