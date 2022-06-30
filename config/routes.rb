Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  root 'user/homes#top'

  namespace :admin do
    resources :maker_genres
    resources :parts_genres
  end

  scope module: :user do
    resources :users
    resources :car_posts
  end





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
