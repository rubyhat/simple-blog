Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #scope "(:locale)", locale: /ru|en/ do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'posts#index'

    resources :posts, only: [:show, :index]
    resources :tags, only: [:show]
    resources :categories, only: [:show]

    namespace :admin do
      resources :categories, except: [:show]
      resources :posts, except: [:show, :index]
      resources :pictures, only: [:create, :destroy]
    end
  end
end
