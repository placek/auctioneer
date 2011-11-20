class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @auctions = current_user.auctions.paginate(:page => params[:page])
  end
end
