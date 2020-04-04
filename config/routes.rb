Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #scope "(:locale)", locale: /ru|en/ do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'posts#index'

    resources :posts
    resources :pictures, only: [:create, :destroy]
    resources :tags, only: [:show]
    resources :categories
  end
end
