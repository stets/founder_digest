Rails.application.routes.draw do
  root 'pages#home'
  get 'apply', to: 'pages#apply', as: 'apply' # new user application form
  get 'thanksalot', to: 'pages#thanks', as: 'thanks' # thanks_path
  get 'start', to: 'pages#start', as: 'start' # new user onboarding

  get '/magic_login', to: 'pages#magic_login', as: 'magic_login'
  
  # Note: named paths will be appended _path, eg apply_path, thanks_path, start_path
  
  devise_for :users
  get 'logout', to: 'pages#logout', as: 'logout'

  # this is for payments
  resources :subscribe, only: [:index]

  # resources :dashboard, only: [:index]
  get 'dashboard', to: 'dashboard#index'
  get 'stakeholder_updates/new', to: 'stakeholder_updates#new'
  

  resources :account, only: [:index, :update]
  resources :billing_portal, only: [:create]
  match '/billing_portal' => 'billing_portal#create', via: [:get]
  match '/cancel' => 'billing_portal#destroy', via: [:get]


  resources :user_submissions, only: [:create]

  # POST to Projects
  resources :projects, only: [:create, :update]

  resources :subscribers, only: [:create, :destroy]

  # static pages
  pages = %w(
    privacy terms
  )

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: "#{page.gsub('-', '_')}"
  end


  namespace :admin do
    get '/', to: 'pages#dashboard'
    resources :user_submissions, only: [:update]
  end

  # admin panels
  # authenticated :user, -> user { user.admin? } do
  #   namespace :admin do
  #     resources :dashboard, only: [:index]
  #     resources :impersonations, only: [:new]
  #     resources :users, only: [:edit, :update, :destroy]
  #   end

  #   # convenience helper
  #   get 'admin', to: 'admin/dashboard#index'
  # end
  
end
