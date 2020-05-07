Rails.application.routes.draw do


	#管理者以外のログインアウト後
	root to: 'tour_guide/home#about'


	get 'tour_guide/window' => 'tour_guide/home#window', as: 'home_window'
	get 'home/introduction' => 'tour_guide/home#introduction', as: 'introduction'



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
	    get 'search/search'
	    get 'orders/today' => 'orders#today', as: 'orders_today'
	    get 'contacts/thanks' => 'contacts#thanks', as: 'contact_thanks'
	    resources :contacts, only: [:index, :new, :edit, :update, :create]
	    resources :comments, only: [:destroy]
	    resources :cities, only: [:index, :create, :edit, :update, :destroy]
	    resources :rooms, only: [:show, :index, :destroy]
	    resources :genres, only: [:index, :create, :edit, :update, :destroy]
	    resources :guides, only: [:show, :index, :update, :destroy,]
	    resources :tourists, only: [:show, :index, :update, :destroy]
	    resources :orders, only: [:show, :index]
	    resources :tours, only: [:show, :index, :update]
	end



	# ツアーとツアーガイド
	namespace :tour_guide do
	    get 'top' => 'home#top'
		get 'guides/thanks' => 'guides#thanks', as: 'guide_thanks'


	    resources :guides, only: [:show, :edit, :update, :destroy] do
	    	get 'tourists/delete' => 'guides#delete', as: 'guide_delete'
	    	get 'orders/new_order' => 'orders#new_order', as: 'new_order'
	    	get 'orders/around_touring' => 'ordersaround_touring', as: 'around_touring'
	    	get 'orders/finished_tour' => 'orders#finished_tour', as: 'finished_tour'
	    	get 'orders/reviewed_tour' => 'orders#reviewed_tour', as: 'reviewed_tour'
	    	resources :notifications, only: [:index]
	    	resources :orders, only: [:index, :update]
	    	resources :rooms, only: [:show, :index, :create] do
	    		resources :messages, only: [:create]
	    	end
	    	resources :tours do
	    		resource :photos, only: [:new, :create]
	    	end
	    end
	end




	# 観光客
	namespace :tourist do
		get 'search/search'
		get 'orders/thanks' => 'orders#thanks', as: 'orders_thanks'
		get 'tourists/thanks' => 'tourists#thanks', as: 'tourist_thanks'

		resources :tourists, only: [:show, :edit, :update, :destroy] do
			get 'tours/bookmarks' => 'book_marks#index', as: 'book_mark'
			get 'tours/my_account' => 'tourist#my_account', as: 'my_account'
			get 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
			get 'tourists/delete' => 'tourists#delete', as: 'tourist_delete'
			resources :orders, only: [:show, :index, :new, :create, :destroy]
			resources :chat_notices, only: [:index]
			resources :rooms, only: [:show, :index, :create] do
		    	resources :messages, only: [:create]
		    end
		    resources :tours, only: [:show, :index] do
		    	resources :comments, only: [:create]
				resource :book_marks, only: [:create, :destroy]
			end
		end

	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
