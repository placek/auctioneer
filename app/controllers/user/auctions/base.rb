#encoding: utf-8
class User::Auctions::Base < User::Base
  before_filter :load_auction

  protected

  def load_auction
    @auction = current_user.auctions.find(params[:auction_id])
  end
#
# def respond_with(*args)
#   super(@restaurant, *args)
# end
end
