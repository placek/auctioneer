require "spec_helper"

describe AuctionsController do
  describe "routing" do

    it "routes to #index" do
      get("/en/auctions").should route_to("auctions#index", :locale => "en")
    end

    it "routes to #show" do
      get("/en/auctions/1").should route_to("auctions#show", :id => "1", :locale => "en")
    end

    it "routes to #new" do
      get("/en/user/auctions/new").should route_to("user/auctions#new", :locale => "en")
    end

    it "routes to #edit" do
      get("/en/user/auctions/1/edit").should route_to("user/auctions#edit", :id => "1", :locale => "en")
    end

    it "routes to #create" do
      post("/en/user/auctions").should route_to("user/auctions#create", :locale => "en")
    end

    it "routes to #update" do
      put("/en/user/auctions/1").should route_to("user/auctions#update", :id => "1", :locale => "en")
    end

    it "routes to #destroy" do
      delete("/en/user/auctions/1").should route_to("user/auctions#destroy", :id => "1", :locale => "en")
    end
  end
end
