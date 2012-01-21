#encoding: utf-8
class User::AuctionsController < User::Base
  before_filter :load_auction, except: [:new, :create, :index, :relance, :do_relance]
  before_filter :load_lanced_auction, only: [:relance, :do_relance]

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

  def publish
    @auction.publish
    respond_with(@auction)
  end

  def republish
    @auction.republish
    respond_with(@auction)
  end

  def close
    @auction.close
    respond_with(@auction)
  end

  def relance
    unless current_user == @auction.user
      respond_with(@auction)
    else
      redirect_to_auction
    end
  end

  def do_relance
    if params[:auction][:actual_price].to_f > @auction.actual_price
      params[:auction][:winner_id] = current_user.id
      @auction.update_attributes(params[:auction])
      redirect_to_auction
    else
      redirect_to user_auction_relance_path
    end
  end

  protected

  def load_auction
    @auction = current_user.auctions.find(params[:id] || params[:auction_id])
  end

  def load_lanced_auction
    @auction = Auction.public.find(params[:auction_id])
  end

  def redirect_to_auction
    redirect_to auction_path(@auction)
  end

end
