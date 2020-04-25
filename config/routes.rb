Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, controllers: { registrations: 'registrations' }
    root "posts#index"
    resources :posts do
      delete '/likes' => 'likes#like'
      delete '/dislikes' => 'likes#dislike'
      resources :comments, except: [:show, :index]
    end
    resources :tags, only: :show
    resources :categories, only: [:show]


    namespace :admin do
      resources :categories, except: :show
      resources :pictures, only: [:create, :destroy]
      get '/fresh_posts' => 'posts#fresh_posts'
      get '/rejected_posts' => 'posts#rejected_posts'
      get '/posts/:id' => 'posts#show'
      resources :posts do
        member do
          post :approve
          post :reject
        end
      end
    end
  end
end
