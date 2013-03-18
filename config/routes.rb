Beehouse::Application.routes.draw do
  
  root to: "houses#new"
  resources :houses, :except => [:index, :destroy] do
    member do
      get :thanks
    end
  end

end
