Rails.application.routes.draw do
  resources :projects
  get :index, controller: :pages
  get :projectindex, controller: :pages
  get :projectview, controller: :pages
  get :resume, controller: :pages
  get :about, controller: :pages
  get :faq, controller: :pages
