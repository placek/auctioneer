require 'spec_helper'

describe AdminHelper do

  describe 'total_count_of' do

    it "should return a quantity of all records in model" do
      2.times { Factory(:user) }
      total_count_of(User).should eq(2)
    end

  end

end
