Rails.application.routes.draw do

  # 会員側
  devise_for :users, controllers: {
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }

  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 会員側
  scope module: :member do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"

    resources :comics, only: [:index, :create]

    get "/users/information/edit" => "users#edit", as: "edit_user"
    get "/users/my_page" => "users#show", as: "user"
    patch "/users/information" => "users#update", as: "update_user"
    get "/users/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
    patch "/users/withdraw" => "users#withdraw", as: "withdraw"

    resources :reviews, only: [:new, :index, :show, :create, :edit, :update, :destroy]

    resources :bookshelves, only: [:index, :show, :destroy]

  end

  # 管理者側
  namespace :admin do
    get "" => "homes#top", as: "top"
    
    resources :comics, only: [:new, :create, :show, :edit, :update, :destroy]
    
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    
    resources :users, only: [:edit, :show, :update, :destroy]
    
    resources :reviews, only: [:index, :show, :destroy]
    
    resources :bookshelves, only: [:index, :show]
    

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
