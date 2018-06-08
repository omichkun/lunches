class CalendarController < ApplicationController
  def index
    @menus = Menu.eager_load(:foods)
  end
end
