Buydonate::Application.routes.draw do
  resources :charities do
    member do
      get 'set'
    end
  end

  resources :merchants

  match '/about',	to: 'static_pages#about'
  match '/privacy',	to: 'static_pages#privacy'
end
