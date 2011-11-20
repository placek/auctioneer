require 'spec_helper'

describe AuctionsHelper do
  describe "short_description" do
    it "should return a shorten text with no html tags and ended with '...'" do
      text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in tortor in orci varius pretium sit amet eget nisl. Aenean in tellus quam. Quisque feugiat dignissim odio, quis tristique felis tempor et. Fusce in ligula magna, quis condimentum erat. In hac habitasse platea dictumst. Nullam euismod hendrerit nibh. Quisque quam mauris, accumsan sit amet blandit ut, viverra in felis. Praesent justo metus, congue eu euismod eget, tincidunt ut purus. Donec accumsan augue augue."
      short_description(text).should match(/.*\.{3}$/)
      short_description(text).should_not match(/<\w+>/)
      short_description(text).length.should eq(255)
    end
  end
end
