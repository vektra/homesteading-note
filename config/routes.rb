HomesteadingNote::Application.routes.draw do
  root      :to => "notes#index"
  resources :settings, only: [:index, :edit, :show, :update]

  # pagination
  get "/notes/page/1",     to: redirect("/notes")
  get "/notes/page",       to: redirect("/notes")
  get "/notes/page/:page", to: "notes#index"

  get "/notes", to: redirect("/")

  get "/notes/:year/:month/:day/:nth_of_day/edit",
      to:          "notes#edit",
      constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/, nth_of_day: /\d+/ },
      as:          "edit_note"

  get "/notes/:year/:month/:day/:nth_of_day",
      to:          "notes#show",
      constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/, nth_of_day: /\d+/ },
      as:          "note"

  get "/notes/new",
      to:          "notes#new",
      as:          "new_note"

  post "/notes",
      to:          "notes#create"

  patch "/notes/:year/:month/:day/:nth_of_day",
      to:          "notes#update",
      constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/, nth_of_day: /\d+/ }

  delete "/notes/:year/:month/:day/:nth_of_day",
      to:          "notes#destroy",
      constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/, nth_of_day: /\d+/ }
end
