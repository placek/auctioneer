class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :show

  def dashboard
    redirect_to user_auctions_path
  end

  def show
  end

end
