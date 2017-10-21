Rails.application.routes.draw do
  # get 'site/index'
  post 'ajax/add_chapter'
  post 'ajax/change_entry_state'
  post 'ajax/edit_entry'
  resources :people
  get 'people/search/:q', as: "people_search", to: 'people#search', :constraints => { :q => /[[a-zA-Z]\d 20%]+/ }
  resources :characters
  get 'characters/search/:q', as: "characters_search", to: 'characters#search', :constraints => { :q => /[[a-zA-Z]\d 20%]+/ }
  resources :entries
  get 'entries/user/:id/:state_id', as: "entries_user_state", to: 'entries#user'
  get 'entries/user/:id', as: "entries_user", to: 'entries#user_all'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :media do 
    resources :actings
    resources :roles
  end
  get 'media/search/:q', as: "media_search", to: 'media#search', :constraints => { :q => /[ \w-20%: ]+/ }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "media#index"
  root 'site#index'
end
