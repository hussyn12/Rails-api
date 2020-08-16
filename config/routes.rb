Rails.application.routes.draw do
	get 'sign_in', to: 'sessions#create'
	root 'sessions#create'
	resources :users, only: [:create], path: "sign_up"
	delete 'logout', to: 'sessions#destroy'
	get 'logged_in', to: "sessions#logged_in"
	get 'auth/:provider/callback', to: 'sessions#social_login'
  end
