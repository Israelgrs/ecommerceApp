class Member < ApplicationRecord
  has_many :ads

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  def full_name
    "#{first_name} #{last_name}"
  end
end
