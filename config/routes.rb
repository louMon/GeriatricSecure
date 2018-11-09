Rails.application.routes.draw do
  
  get 'recomendacion_receta/edit'

  resources :pacientes
  resources :cita
  resources :registro_consulta
  resources :historia_clinicas
  
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
  end

end