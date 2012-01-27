class Admin::AuctionsController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admin'

  def index
    @auctions = Auction.search(params[:q]).paginate(page: params[:page])
  end

  def destroy
    @auction = Auction.find(params[:id]).destroy
    flash[:notice] = t('admin.registrations.destroy')
    redirect_to admin_auctions_path
  end
end
