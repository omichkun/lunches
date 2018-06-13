class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_today_menu

  private
  def set_today_menu
    session[:today_menu] = Menu.today_menu.first
  end

  def check_admin
    unless current_user.admin?
      raise ActiveRecord::RecordNotFound
    end
  end



end

