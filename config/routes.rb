Rails.application.routes.draw do
  devise_for :owners, controllers: {
    sessions: 'owners/sessions'
  }  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  resources :zombies do
      resources :brains
  end

  root to: 'zombies#index'

  devise_scope :owner do    
			get "sessions/owners/admins/List",
			to: "owners/sessions#List",
			as: "admins_List"
		end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
