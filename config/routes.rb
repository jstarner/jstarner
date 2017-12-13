Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :projects, except: [ :show ]
  end

  get :index, controller: :pages
  get :resume, controller: :pages
  get :about, controller: :pages
  get :faq, controller: :pages

  resources :projects, only: [ :index, :show ]

  root 'pages#index'
end
