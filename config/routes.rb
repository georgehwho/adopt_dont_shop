Rails.application.routes.draw do
  root to: 'application#welcome'

  get '/applications/new', to: 'applications#new', as: 'new_application'
  get '/applications/:id', to: 'applications#show', as: 'application'
  post '/applications', to: 'applications#create'
  patch '/applications/:id', to: 'applications#update'

  post '/pet_applications', to: 'pet_applications#create'
  patch '/pet_applications', to: 'pet_applications#update'

  # get '/admin/shelters', to: 'admin#shelters'
  # get '/admin/applications/:app_id', to: 'admin#app_show', as: 'admin_app'

  namespace :admin do
    resources :shelters, only: [:index, :show]
    resources :applications, only: [:show]
  end

  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new', as: 'new_shelter'
  get '/shelters/:id', to: 'shelters#show', as: 'shelter'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit', as: 'edit_shelter'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show', as: 'pet'
  get '/pets/:id/edit', to: 'pets#edit', as: 'edit_pet'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  get '/veterinary_offices', to: 'veterinary_offices#index'
  get '/veterinary_offices/new', to: 'veterinary_offices#new', as: 'new_veterinary_office'
  get '/veterinary_offices/:id', to: 'veterinary_offices#show', as: 'veterinary_office'
  post '/veterinary_offices', to: 'veterinary_offices#create'
  get '/veterinary_offices/:id/edit', to: 'veterinary_offices#edit', as: 'edit_veterinary_office'
  patch '/veterinary_offices/:id', to: 'veterinary_offices#update'
  delete '/veterinary_offices/:id', to: 'veterinary_offices#destroy'

  get '/veterinarians', to: 'veterinarians#index'
  get '/veterinarians/:id', to: 'veterinarians#show', as: 'veterinarian'
  get '/veterinarians/:id/edit', to: 'veterinarians#edit', as: 'edit_veterinarian'
  patch '/veterinarians/:id', to: 'veterinarians#update'
  delete '/veterinarians/:id', to: 'veterinarians#destroy'

  get '/shelters/:shelter_id/pets', to: 'shelters#pets'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new', as: 'new_pet'
  post '/shelters/:shelter_id/pets', to: 'pets#create'

  get '/veterinary_offices/:veterinary_office_id/veterinarians', to: 'veterinary_offices#veterinarians'
  get '/veterinary_offices/:veterinary_office_id/veterinarians/new', to: 'veterinarians#new', as: 'new_veterinarian'
  post '/veterinary_offices/:veterinary_office_id/veterinarians', to: 'veterinarians#create'

end
