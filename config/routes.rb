Rails.application.routes.draw do
	root "top#index"

	resources :members do
		resources :rentals
		resources :reservations
        end
	resources :books do
	  collection { get "search" }
	end
	resource :session, only: [:create, :destroy]
	resource :account, only: [:show, :edit, :update, :destroy]
end
