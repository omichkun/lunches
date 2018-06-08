class Menu < ApplicationRecord
  has_many :foods_menus, dependent: :destroy
  has_many :foods, through: :foods_menus

  accepts_nested_attributes_for :foods, allow_destroy: true, :reject_if => lambda { |a| a[:food_id].blank? }

  enum weekday: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  validates :weekday, uniqueness: true
  validates :weekday, presence: true



  def self.today_menu
    today = Date.today.strftime("%A").downcase
    self.eager_load(:foods).where(weekday: today)
  end


end
