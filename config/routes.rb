Buydonate::Application.routes.draw do
  put "contact_forms_controller/create"

  resources :charities do
    member do
      get 'set'
    end
  end

  resources :merchants do
    member do
      get 'shop'
    end
  end
  
  resources :contact_forms

  root to: 'merchants#index'

  match '/about',	to: 'static_pages#about'
  match '/privacy',	to: 'static_pages#privacy'
  match '/contact',	to: 'contact_forms#new'
end
