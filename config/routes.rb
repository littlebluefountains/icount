Icount2::Application.routes.draw do

  resources :users
  resources :roles
  resources :products, :zones, :stations, :tanks, :pumps
  resources :suppliers, :sales_periods, :employees

  devise_for :users, skip: [:registrations, :sessions]

  as :user do
    get "login" => "devise/sessions#new", as: :new_user_session
    post "/login" => "devise/sessions#create", as: :user_session
    delete "/logout" => "devise/sessions#destroy", as: :destroy_user_session
    #get "profile" => "devise/sessions#edit", as: :edit_user_session
  end



  authenticated :user do
    root to: 'home#index'
  end

  root to: redirect('/login')

  
end
