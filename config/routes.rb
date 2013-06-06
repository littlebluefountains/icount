Icount2::Application.routes.draw do


  # resources :accounts
  # resources :users
  #   resources :roles

  devise_for :users, skip: [:registrations, :sessions]

  resources :users
  resources :roles
  resources :accounts

  #put it here, can users login at subdomain??
  as :user do
    get "login" => "devise/sessions#new", as: :new_user_session
    post "/login" => "devise/sessions#create", as: :user_session
    delete "/logout" => "devise/sessions#destroy", as: :destroy_user_session
    #get "profile" => "devise/sessions#edit", as: :edit_user_session
  end

  constraints(Subdomain) do

    get "reports/capacity"
    get "reports/stock"
    get "reports/stock_addition"
    get "reports/stock_deduction"
    get "reports/sales"
    get "reports/trends"

    

    resources :products, :zones, :stations, :tanks, :pumps
    resources :suppliers, :sales_periods, :employees, :product_prices
    resources :waybills, :waybill_approvals
    resources :sale_meter_readings
    resources :report_users
    resources :dipping_histories

    #sales approval
    get "sales_approval" => "sales_approval#index", as: :list_sales_approval
    get "sales_approval/:id" => "sales_approval#show", as: :show_sales_approval
    get "sales_approval/:id/edit" => "sales_approval#edit", as: :edit_sales_approval
    post "/sales_approval/:id" => "sales_approval#update", as: :sales_approval

    #if the user is authenticated in the context of a subdomain, go to his index page
    # as :user do
    #   get "login" => "devise/sessions#new", as: :new_user_session
    #   post "/login" => "devise/sessions#create", as: :user_session
    #   delete "/logout" => "devise/sessions#destroy", as: :destroy_user_session
    #   #get "profile" => "devise/sessions#edit", as: :edit_user_session
    # end
    
    authenticated :user do
      root to: 'home#index'

      delete "/logout" => "devise/sessions#destroy", as: :destroy_user_session
      
    end
  end #remove

    
  #if user is authenticated at the root domain, route to account index
  authenticated :user do
    root to: 'accounts#index'

  end

  #end

#end #remove
  # constraints(Subdomain) do
  #     match '/' => 'home#index'
  # end

  #root to: redirect('/login')
  root to: 'accounts#index'
  #resources :accounts
  #root to: 'accounts#index'
  
end
