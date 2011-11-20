module AuctionsHelper
  def short_description text
    truncate(strip_tags(text), :length => 255)
  end
end
