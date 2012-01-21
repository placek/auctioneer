require 'spec_helper'

describe Auction do
  Timecop.freeze(Time.now) do
    describe 'about_to_finish' do
      before { Timecop.freeze(7.days.ago) { Factory(:public_auction) } }
      subject { Auction.about_to_finish }
      it { should_not be_empty }
    end
    describe 'about_to_finish' do
      before { Timecop.freeze(7.days.ago - 5.minutes) { Factory(:public_auction) } }
      subject { Auction.about_to_finish }
      it { should be_empty }
    end
    describe 'about_to_finish' do
      before { Timecop.freeze(7.days.ago + 65.minutes) { Factory(:public_auction) } }
      subject { Auction.about_to_finish }
      it { should be_empty }
    end
    describe 'close_auctions' do
      before { Timecop.freeze(7.days.ago) { Factory(:public_auction) } }
      subject { Auction.closed.count }
      before { Auction.close_auctions }
      it { should eq(1) }
    end
  end
end
