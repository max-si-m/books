class Admin::BaseController < ActionController::Base
  layout 'application'

  before_action :check_admin!
  before_action :authenticate_admin_user!

  private
  ##############################################################################

  def check_admin!
    redirect_to root_path, notice: 'Access denied!' if current_user
  end
end
