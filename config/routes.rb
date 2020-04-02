Rails.application.routes.draw do

  
  namespace :tour_guide do
    get 'tours/new'
    get 'tours/show'
    get 'tours/index'
    get 'tours/edit'
  end
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :guides, controllers: {
  sessions:      'guides/sessions',
  passwords:     'guides/passwords',
  registrations: 'guides/registrations'
}

namespace :admin do
    get 'home/top'
    resources :cities, only: [:create, :index, :edit, :update, :destroy]
    resources :genres, only: [:create, :index, :edit, :update, :destroy]
end

namespace :tour_guide do
    get 'home/top'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
