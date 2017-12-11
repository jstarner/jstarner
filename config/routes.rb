Rails.application.routes.draw do
  get :index, controller: :pages
  get :projects, controller: :pages
  get :projectview, controller: :pages
  get :resume, controller: :pages
  get :about, controller: :pages
  get :faq, controller: :pages
end
