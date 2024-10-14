Rails.application.routes.draw do

  # 会員側
  devise_for :users, skip: [:passwords], controllers: {
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
    patch "/users/withdraw" => "users#withdraw", as: "withdraw"

    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy]

    resources :bookshelves, only: [:index, :show, :destroy]

  end

  # 管理者側
  namespace :admin do
    get "" => "homes#top", as: "top"

    resources :users, only: [:edit, :show, :update, :destroy]
    resources :posts, only: [:index, :show, :destroy]
    resources :bookshelves, only: [:index, :show]
    resources :comics, only: [:new, :index, :show, :edit, :update, :destroy]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
