class Admin::AdminsController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admin'

  def dashboard
  end

  def index
    @admins = Admin.email_like(params[:like] || '%').paginate(:page => params[:page])
  end

  def destroy
    @admin = Admin.find(params[:id]).destroy
    flash[:notice] = t('admin.registrations.destroy')
    redirect_to admin_admins_path
  end

  def new
    sign_out
    redirect_to new_admin_registration_path
  end

end
