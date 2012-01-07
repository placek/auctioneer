require "spec_helper"

describe ApplicationController do
  describe "routing" do

    { "/admin" => "admin/admins#dashboard",
      "/admin/admins" => "admin/admins#index",
      "/admin/users" => "admin/users#index",
      "/" => "static_pages#landing"
    }.each_entry do |route|
      it "routes to static_#{route.last}" do
        get(route.first).should route_to(route.last)
      end
    end

  end
end
