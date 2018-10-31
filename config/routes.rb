Rails.application.routes.draw do
  
  devise_for :usuarios
    devise_scope :usuario do
      get "signup", to: "devise/registrations#new"
      get "login", to: "devise/sessions#new"
      get "logout", to: "devise/sessions#destroy"
      authenticated :usuario do
        root 'cita#index'
    end

    unauthenticated do
      root 'devise/sessions#new'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end


  resources :people
  resources :cita

end