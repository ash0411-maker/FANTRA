Rails.application.routes.draw do


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
	    get 'orders/today' => 'orders#today', as: 'orders_today'
	    resources :cities, only: [:create, :index, :edit, :update, :destroy]
	    resources :rooms, only: [:show, :index, :destroy]
	    resources :genres, only: [:create, :index, :edit, :update, :destroy]
	    resources :guides, only: [:index, :show, :destroy, :update]
	    resources :tourists, only: [:index, :show, :update, :destroy]
	    resources :orders, only: [:index, :show]
	    resources :tours, only: [:index, :show]
	end



	# ツアーとツアーガイド
	namespace :tour_guide do
	    get 'top' => 'home#top'
	    get 'tourists/delete' => 'guides#delete', as: 'guide_delete'
		get 'guides/thanks' => 'guides#thanks', as: 'guide_thanks'
	    resources :guides, only: [:show, :edit, :update, :destroy]
	    resources :orders, only: [:index, :update]
	    resources :rooms, only: [:index, :show, :create] do
	    	resources :messages, only: [:create]
	    end
	    resources :tours do
	    	resource :photos, only: [:new, :create]
	    end
	end




	# 観光客
	namespace :tourist do
		get 'search/search'
		get 'tours/bookmarks' => 'book_marks#index', as: 'book_mark'
		get 'orders/thanks' => 'orders#thanks', as: 'orders_thanks'
		get 'tourists/delete' => 'tourists#delete', as: 'tourist_delete'
		get 'tourists/thanks' => 'tourists#thanks', as: 'tourist_thanks'

		resources :rooms, only: [:index, :show, :create] do
	    	resources :messages, only: [:create]
	    end

		resources :tourists, only: [:show, :edit, :update, :destroy] do
			get 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
			resources :orders, only: [:show, :new, :create, :destroy]
		end

		resources :tours, only: [:show, :index] do
			resource :book_marks, only: [:create, :destroy]
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
