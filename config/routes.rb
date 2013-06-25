HomesteadingNote::Application.routes.draw do
  root      :to => "notes#index"
  resources :notes
  resources :settings, only: [:index, :edit, :show, :update]
end
