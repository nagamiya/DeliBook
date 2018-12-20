Rails.application.routes.draw do
	root "top#index"

	resources :members
	resources :books do
	  collection { get "search" }
	end
end
