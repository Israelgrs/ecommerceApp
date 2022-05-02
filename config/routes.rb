Rails.application.routes.draw do
  namespace :site do
    get 'home', to: 'home#index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
    get 'categories/index'
  end
  devise_for :admins, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions'}
  devise_for :members
  root 'site/home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
