class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  after_create :set_first_admin

  has_many :orders, dependent: :destroy


  private

  def set_first_admin
    if User.count == 1
      User.first.update admin: true
    end
  end
end
