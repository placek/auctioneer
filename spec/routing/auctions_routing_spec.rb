require "spec_helper"

describe AuctionsController do
  describe "routing" do

    it "routes to #index" do
      get("/en/auctions").should route_to("auctions#index", :locale => "en")
    end

    it "routes to #new" do
      get("/en/auctions/new").should route_to("auctions#new", :locale => "en")
    end

    it "routes to #show" do
      get("/en/auctions/1").should route_to("auctions#show", :id => "1", :locale => "en")
    end

    it "routes to #edit" do
      get("/en/auctions/1/edit").should route_to("auctions#edit", :id => "1", :locale => "en")
    end

    it "routes to #create" do
      post("/en/auctions").should route_to("auctions#create", :locale => "en")
    end

    it "routes to #update" do
      put("/en/auctions/1").should route_to("auctions#update", :id => "1", :locale => "en")
    end

    it "routes to #destroy" do
      delete("/en/auctions/1").should route_to("auctions#destroy", :id => "1", :locale => "en")
    end
  end
end
