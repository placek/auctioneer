#encoding: utf-8
class User::AuctionsController < User::Base
  before_filter :load_auction, except: [:new, :create, :index]

  def index
    @auctions = current_user.auctions.paginate(page: params[:page])
  end

  def show
    respond_with(@auction)
  end

  def new
    @auction = current_user.auctions.build
    respond_with(@auction)
  end

  def edit
    respond_with(@auction)
  end

  def create
    @auction = current_user.auctions.create(params[:auction])
    respond_with(@auction)
  end

  def update
    @auction.update_attributes(params[:auction])
    respond_with(@auction)
  end

  def destroy
    @auction = @auction.destroy
    respond_with(@auction)
  end

  protected

  def load_auction
    @auction = current_user.auctions.find(params[:id])
  end
end
