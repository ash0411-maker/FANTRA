Rails.application.routes.draw do

  #管理者以外のトップ画面
  root to: 'tour_guide/home#about'

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

# 管理者
namespace :admin do
    get 'home/top'
    resources :cities, only: [:create, :index, :edit, :update, :destroy]
    resources :genres, only: [:create, :index, :edit, :update, :destroy]
end

# ツアーとツアー提供者
namespace :tour_guide do
    get 'top' => 'home#top'
    get 'tours/thanks' => 'tours#thanks', as: 'thanks'
    resources :guides, only: [:show, :edit, :update]
    resources :tours do
    	resources :photos, only: [:new, :create]
    end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
