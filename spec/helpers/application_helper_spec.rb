require 'spec_helper'

describe ApplicationHelper do
  describe "after_sign_in_path_for" do
    it "should return a proper url" do
      after_sign_in_path_for(Factory(:user)).should eq('/en/dashboard')
    end
  end
end
