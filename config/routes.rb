Buydonate::Application.routes.draw do
  devise_for :users

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
  match '/contact',	to: 'contact_forms#new'

  root to: 'merchants#index'

  match '/about',	to: 'static_pages#about'
  match '/privacy',	to: 'static_pages#privacy'
end
