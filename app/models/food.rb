class Food < ApplicationRecord
  has_many :foods_menus
  has_many :menus, through: :foods_menus


  enum food_type: [:first_course, :main_course, :drink]

  has_many :first_courses, class_name: "Order", foreign_key: "first_course_id"
  has_many :main_courses, class_name: "Order", foreign_key: "main_course_id"
  has_many :drinks, class_name: "Order", foreign_key: "drink_id"


  mount_uploader :image, FoodImageUploader


end
