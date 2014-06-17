require "spec_helper"

describe "routes for NotesController", type: :routing do
  it "GET '/' routes to NotesController#index" do
    expect(get("/")).to route_to("notes#index")
  end

  it "GET '/notes' routes to NotesController#index" do
    expect(get("/notes")).to route_to("notes#index")
  end

  it "GET '/notes/page/1' routes to NotesController#index" do
    expect(get("/notes/page/1")).to route_to("notes#index", page: "1")
  end

  it "GET '/notes/page' routes to NotesController#index" do
    expect(get("/notes/page")).to route_to("notes#index")
  end

  it "GET '/notes/page/:id' routes to NotesController#index" do
    expect(get("/notes/page/2")).to route_to("notes#index", page: "2")
  end

  it "GET '/notes/new' routes to NotesController#new" do
    expect(get("/notes/new")).to route_to("notes#new")
  end

  it "POST '/notes' routes to NotesController#create" do
    expect(post("/notes")).to route_to("notes#create")
  end

  it "POST '/notes/:year/:month/:day' routes to NotesController#create" do
    expect(post("/notes/2014/01/01")).to route_to("notes#create",
      year: "2014", month: "01", day: "01")
    expect(post("/notes/2014/1/1")).to route_to("notes#create",
      year: "2014", month: "1", day: "1")
  end

  it "GET '/notes/:year/:month/:day/:slug' routes to NotesController#show" do
    expect(get("/notes/2014/01/01/slug")).to route_to("notes#show",
      year: "2014", month: "01", day: "01", slug: "slug")
    expect(get("/notes/2014/1/1/slug")).to route_to("notes#show",
      year: "2014", month: "1", day: "1", slug: "slug")
  end

  it "GET '/notes/:year/:month/:day/:slug/edit' routes to NotesController#edit" do
    expect(get("/notes/2014/01/01/slug/edit")).to route_to("notes#edit",
      year: "2014", month: "01", day: "01", slug: "slug")
    expect(get("/notes/2014/1/1/slug/edit")).to route_to("notes#edit",
      year: "2014", month: "1", day: "1", slug: "slug")
  end

  it "PATCH '/notes/:year/:month/:day/:slug' routes to NotesController#update" do
    expect(patch("/notes/2014/01/01/slug")).to route_to("notes#update",
      year: "2014", month: "01", day: "01", slug: "slug")
    expect(patch("/notes/2014/1/1/slug")).to route_to("notes#update",
      year: "2014", month: "1", day: "1", slug: "slug")
  end

  it "DELETE '/notes/:year/:month/:day/:slug' routes to NotesController#destroy" do
    expect(delete("/notes/2014/01/01/slug")).to route_to("notes#destroy",
      year: "2014", month: "01", day: "01", slug: "slug")
    expect(delete("/notes/2014/1/1/slug")).to route_to("notes#destroy",
      year: "2014", month: "1", day: "1", slug: "slug")
  end
end
