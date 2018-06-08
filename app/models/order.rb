class Order < ApplicationRecord
  belongs_to :user
  belongs_to :first_course, class_name: 'Food'
  belongs_to :main_course, class_name: 'Food'
  belongs_to :drink, class_name: 'Food'


  scope :all_orders, -> {eager_load(:first_course).eager_load(:main_course).eager_load(:drink)}

end
