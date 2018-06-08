module OrdersHelper
  def order_sum order
    order.first_course.price + order.main_course.price + order.drink.price
  end
end
