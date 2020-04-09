Rails.application.routes.draw do


  namespace :admin do
    get 'guide/index'
    get 'guide/show'
    get 'guide/edit'
  end
  namespace :admin do
    get 'tousits/index'
    get 'tousits/show'
    get 'tousits/edit'
  end
	  #管理者以外のログインアウト後
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

	devise_for :tourists, controllers: {
	  sessions:      'guides/sessions',
	  passwords:     'guides/passwords',
	  registrations: 'guides/registrations'
	}




	# 管理者
	namespace :admin do
	    get 'home/top'
	    resources :cities, only: [:create, :index, :edit, :update, :destroy]
	    resources :genres, only: [:create, :index, :edit, :update, :destroy]
	    resources :orders, only: [:index, :show]
	    resources :tours, only: [:index, :show]
	end


	# ツアーとツアーガイド
	namespace :tour_guide do
	    get 'top' => 'home#top'
	    get 'tours/thanks' => 'tours#thanks', as: 'thanks'
	    resources :guides, only: [:show, :edit, :update]
	    resources :orders, only: [:index, :update]
	    resources :tours do
	    	resource :photos, only: [:new, :create]
	    end
	end


	# 観光客
	namespace :tourist do
		get 'search/search'
		get 'tours/bookmarks' => 'book_marks#index', as: 'book_mark'
		get 'orders/thanks' => 'orders#thanks', as: 'orders_thanks'

		resources :tourists, only: [:show, :edit, :update] do
			get 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
			resources :orders, only: [:show, :new, :create, :destroy]
		end

		resources :tours, only: [:show, :index] do
			resource :book_marks, only: [:create, :destroy]
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
