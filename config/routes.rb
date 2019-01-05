Rails.application.routes.draw do
	root "top#index"

	resources :members, only: [:new, :create] do
		resources :rentals, only: [:index, :create]
		resources :reservations, only: [:index, :create, :destroy]
        end
	resources :books, only: [:index, :show] do
	  collection { get "search" }
	end
	resource :session, only: [:create, :destroy]
	resource :account, only: [:show, :edit, :update, :destroy]
  
	namespace :admin do
	  root to: "top#index"
          resources :members do
            collection { get "search" }
          end
	  resources :books do
            collection { get "search" }
	  end
	  resources :rentals do
            collection { get "search" }
            member { get "bookreturn" }
	  end
	  resources :reservations, only: [:index, :create, :destroy] do
            collection { get "search" }
	  end
        end
end
