Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, controllers: { registrations: 'registrations' }
    root "posts#index"
    resources :posts, only: [:show, :index] do
      delete '/likes' => 'likes#like'
      delete '/dislikes' => 'likes#dislike'
      resources :comments, except: [:show]
    end
    resources :tags, only: [:show]
    resources :categories, only: [:show]


    namespace :admin do
      resources :posts, except: [:show, :index]
      resources :categories, except: [:show]
      resources :pictures, only: [:create, :destroy]
    end
  end
end
