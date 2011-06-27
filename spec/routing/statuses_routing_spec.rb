require "spec_helper"

describe StatusesController do
  describe "routing" do

    it "routes to #index" do
      get("/statuses").should route_to("statuses#index")
    end

    it "routes to #new" do
      get("/statuses/new").should route_to("statuses#new")
    end

    it "routes to #show" do
      get("/statuses/1").should route_to("statuses#show", :id => "1")
    end

    it "routes to #create" do
      post("/statuses").should route_to("statuses#create")
    end

    it "routes to #destroy" do
      delete("/statuses/1").should route_to("statuses#destroy", :id => "1")
    end

  end
end
