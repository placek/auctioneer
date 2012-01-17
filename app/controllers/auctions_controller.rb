class AuctionsController < ApplicationController

  def index
    @auctions = Auction.public.search(params[:q]).order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def show
    @auction = Auction.find(params[:id])
  end

  private

  def sort_column
    Auction.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
