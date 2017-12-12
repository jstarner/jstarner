class AdminController < ApplicationController
  def redirect_unless_user_is_admin
    unless current_user && current_user.is_admin
      redirect_to root_url, notice: 'You do not have permission to access the requested page.'
    end
  end
end
