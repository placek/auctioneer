class AuctionsController < ApplicationController

  def index
    @auctions = Auction.paginate(page: params[:page])
  end

  def show
    @auction = Auction.find(params[:id])
  end
end
