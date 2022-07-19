Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  root 'user/homes#top'
  get "/about" => "user/homes#about", as: "about"
  patch "/user/edit" => "user/users#withdrawl", as: "withdrawl"

  namespace :admin do
    resources :maker_genres
    resources :parts_genres
  end

  scope module: :user do
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
        collection do
          get 'search'
        end
    end
    resources :car_posts do
      resources :comments, only: [:create]
      resources :goods, only: [:create, :destroy]
    end
    resources :maker_genres, only: [:index, :show]
    resources :parts_genres, only: [:index, :show]
  end





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
