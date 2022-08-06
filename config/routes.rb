Rails.application.routes.draw do




  devise_for :customers,skip:[:password],controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }

  scope module: :public do
    get 'customers/my_page' => 'customers#mypage'
    resources :customers, only:[:show,:edit,:update] do
      member do
        get 'unsubscrib'
        get 'followings'
        get 'followers'
        get 'goods'
      end
      collection do
        patch 'withdraw'
      end
    end
    root to: "travels#index"
    resources :travels, only: [:show,:new,:create,:edit,:update,:destroy] do
      resources :travel_details, only: [:new,:create,:edit,:update,:destroy]
      resources :comments, only: [:new,:create,:destroy]
      resource :goods, only: [:create,:destroy]
    end
    resources :relationships, only: [:create,:destroy]
  end

  namespace :admin do
    root to: "homes#top"
    resources :customers, only:[:show,:edit,:update]
    resources :travels, only:[:index,:show,:destroy]
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
