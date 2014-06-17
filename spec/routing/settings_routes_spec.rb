require "spec_helper"

describe "routes for Settings", type: :routing do
  it "GET '/settings' routes to SettingsController#index" do
    expect(get("/settings")).to route_to("settings#index")
  end

  it "GET '/settings/new' routes to SettingsController#show" do
    expect(get("/settings/new")).to route_to("settings#show", id: "new")
  end

  it "POST '/settings' is not routable" do
    expect(post("/settings")).not_to be_routable
  end

  it "GET '/settings/:id' routes to SettingsController#show" do
    expect(get("/settings/1")).to route_to("settings#show", id: "1")
  end

  it "GET '/settings/:id/edit' routes to SettingsController#edit" do
    expect(get("/settings/1/edit")).to route_to("settings#edit", id: "1")
  end

  it "PUT '/settings/:id' routes to SettingsController#update" do
    expect(put("/settings/1")).to route_to("settings#update", id: "1")
  end

  it "PATCH '/settings/:id' routes to SettingsController#update" do
    expect(patch("/settings/1")).to route_to("settings#update", id: "1")
  end

  it "DELETE '/settings/:id' is not routable" do
    expect(delete("/settings/1")).not_to be_routable
  end
end
