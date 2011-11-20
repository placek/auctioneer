class AuctionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @auctions = Auction.paginate(:page => params[:page])
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def new
    @auction = Auction.new
  end

  def edit
    @auction = current_user.auctions.find(params[:id])
  end

  def create
    @auction = current_user.auctions.build(params[:auction])
    if @auction.save
      redirect_to @auction, notice: I18n.t('auctions.created')
    else
      render action: "new"
    end
  end

  def update
    @auction = current_user.auctions.find(params[:id])
    if @auction.update_attributes(params[:auction])
      redirect_to @auction, notice: I18n.t('auctions.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @auction = current_user.auctions.find(params[:id])
    @auction.destroy
    redirect_to auctions_url
  end
end
