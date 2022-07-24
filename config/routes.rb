Rails.application.routes.draw do

  devise_for :customers,skip:[:password],controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }

  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    resources :customers, only:[:edit,:update] do
      member do
        get 'unsubscrib'
      end
      
      collection do
        patch 'withdraw'
      end
        
    end
    root to: 'travel#index'
    resources :travels, only: [:new,:create,:edit,:update,:destroy]
    resources :travel_details, only: [:new,:create,:edit,:update,:destroy]
    resources :follows, only: [:create,:destroy]
    resources :comments, only: [:create,:destroy]
    resources :goods, only: [:create,:destroy]
  end

  scope module: :admin do
    resources :customers, only:[:show,:edit,:update]
    resources :travels, only:[:index,:show,:destroy]
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
