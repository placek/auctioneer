class AuctionsController < ApplicationController

  def index
    @auctions = Auction.public.paginate(page: params[:page])
  end

  def show
    @auction = Auction.find(params[:id])
  end
end
