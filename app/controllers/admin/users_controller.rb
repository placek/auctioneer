class Admin::UsersController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admin'

  def index
    @users = User.email_like(params[:like] || '%').paginate(:page => params[:page])
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:notice] = t('admin.registrations.destroy')
    redirect_to admin_users_path
  end

  def login
    sign_in(:user, User.find(params[:id]))
    redirect_to('/')
  end

  def confirm
    User.find(params[:id]).confirm!
    redirect_to admin_users_path
  end
end
