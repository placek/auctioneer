every :hour do
  runner "Auction.close_auctions"
end

every 2.minutes do
  command "echo 'lol'"
end
