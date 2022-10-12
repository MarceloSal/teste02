Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'members/index'
    
  end
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins # Administradores
    resources :members # Cadastro de Membros
    resources :archives #arquivos
    root to: 'archives#index'
  end
  devise_for :users
  devise_for :admins
 
  get 'inicio', to: 'site/welcome#index'
  get 'admin', to: 'admins_backoffice/welcome#index'
  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
