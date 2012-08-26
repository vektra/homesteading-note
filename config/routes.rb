HomesteadingStatus::Application.routes.draw do
  root      :to => "statuses#index"
  resources :statuses
end
