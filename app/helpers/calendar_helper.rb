module CalendarHelper

  def today_menu menu
    if session[:today_menu].weekday == menu.weekday
      link_to("Make Order", new_order_path, class: 'btn btn-primary')
    else
      link_to("See More", menu_path(menu), class: 'btn btn-default')
    end
  end

  def bg_color menu
    if session[:today_menu].weekday == menu.weekday
      'bg-info'
    else
      'bg-warning'
    end
  end
end
