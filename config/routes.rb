HomesteadingNote::Application.routes.draw do
  root      to: "notes#index"
  resources :settings, only: [:index, :edit, :show, :update]

  # Pagination

  get "/notes/page/1",     to: redirect("/notes")
  get "/notes/page",       to: redirect("/notes")
  get "/notes/page/:page", to: "notes#index"

  get "/notes", to: redirect("/")

  # Rails Form CRUD

  get "/notes/new",
      to:          "notes#new",
      as:          "new_note"

  post "/notes",
      to:          "notes#create"

  post "/articles/:year/:month/:day",
       to:          "notes#create",
       constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/ }

  get "/notes/:year/:month/:day/:slug",
      to:          "notes#show",
      constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/ },
      as:          "note"

  get "/notes/:year/:month/:day/:slug/edit",
      to:          "notes#edit",
      constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/ },
      as:          "edit_note"

  patch "/notes/:year/:month/:day/:slug",
      to:          "notes#update",
      constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/ }

  delete "/notes/:year/:month/:day/:slug",
      to:          "notes#destroy",
      constraints: { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/ }
end
