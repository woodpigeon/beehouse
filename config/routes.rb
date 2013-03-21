Beehouse::Application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  namespace :admin do
    resources :products
  end


  root to: "houses#new"
  resources :houses, :except => [:index, :destroy] do
    member do
      get :thanks
    end
  end

end
