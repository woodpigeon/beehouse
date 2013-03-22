Beehouse::Application.routes.draw do
  
  
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root to: "houses#new"
  
  resources :houses, :except => [:index, :destroy] do
    member do
      get :thanks
    end
  end

end
