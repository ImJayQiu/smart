Rails.application.routes.draw do

	resources :studentscores do
		collection do
			get :import
			post :imported
		end
	end

	resources :cscores do
		collection do
			get :import
			post :imported
		end
	end

	resources :enrollcourses do
		collection do
			get :import
			post :imported
			get :multi
			post :multienroll
		end
	end

	resources :majors

	resources :semesters

	resources :cschedules do
		collection do
			get :import
			post :imported
		end
	end

	resources :coutlines do
		collection do
			get :import
			post :imported
		end
	end

	resources :ustatuses do 
		collection do
			get :import
			post :imported
		end
	end

	resources :visas do
		collection do
			get :renew
			get :expired
			get :import
			post :imported
		end
	end

	devise_for :users 	# must before users

	resources :users do
		collection do
			get :students
			get :lecturers
			get :deans
			get :admins
			get :import
			get :new_user # get create_user form 
			post :create_user # post create_user form to create_user action
			post :imported
		end
		member do
			get :edit_password
			put :update_password
			patch :update_password
		end
	end

	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"

	root 'home#index'


	# Example of regular route:
	#   get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

	# Example resource route (maps HTTP verbs to controller actions automatically):
	#   resources :products

	# Example resource route with options:
	#   resources :products do
	#     member do
	#       get 'short'
	#       post 'toggle'
	#     end
	#
	#     collection do
	#       get 'sold'
	#     end
	#   end

	# Example resource route with sub-resources:
	#   resources :products do
	#     resources :comments, :sales
	#     resource :seller
	#   end

	# Example resource route with more complex sub-resources:
	#   resources :products do
	#     resources :comments
	#     resources :sales do
	#       get 'recent', on: :collection
	#     end
	#   end

	# Example resource route with concerns:
	#   concern :toggleable do
	#     post 'toggle'
	#   end
	#   resources :posts, concerns: :toggleable
	#   resources :photos, concerns: :toggleable

	# Example resource route within a namespace:
	#   namespace :admin do
	#     # Directs /admin/products/* to Admin::ProductsController
	#     # (app/controllers/admin/products_controller.rb)
	#     resources :products
	#   end
end
