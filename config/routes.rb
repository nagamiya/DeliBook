Rails.application.routes.draw do
	root "top#index"

	resources :members
	resources :books do
	  collection { get "search" }
	end
	resource :session, only: [:create, :destroy]
	resource :account, only: [:show, :edit, :update]
end
