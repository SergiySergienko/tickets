Rails.application.routes.draw do
	root 'enquiries#index'
	resources :enquiries, only: [:new, :create, :show, :index]
  
	get '/login'     => 'sessions#new'
	get '/add_test'  => 'sessions#add_test_user'
	post '/login'    => 'sessions#create'
	delete '/logout' => 'sessions#destroy' 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
