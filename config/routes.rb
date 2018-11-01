Rails.application.routes.draw do
  

  get 'pacientes/index'

  get 'pacientes/new'

  get 'pacientes/show'

  get 'pacientes/edit'

  get 'historia_clinicas/show'

  get 'historia_clinicas/edit'

  devise_for :usuarios
    devise_scope :usuario do
      get "signup", to: "devise/registrations#new"
      get "login", to: "devise/sessions#new"
      get "sign_out", to: "devise/sessions#destroy"
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
  resources :registro_consulta
  resources :historia_clinicas
  resources :pacientes

end