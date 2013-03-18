Beehouse::Application.routes.draw do
  
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
