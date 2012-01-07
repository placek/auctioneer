class AuctionsController < ApplicationController

  def index
    @auctions = Auction.public.paginate(page: params[:page])
  end

  def search
    @auctions = Auction.public.search(params[:q]).paginate(page: params[:page])
    render :index
  end

  def show
    @auction = Auction.find(params[:id])
  end
end
