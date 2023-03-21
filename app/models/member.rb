class Member < ApplicationRecord
  # Ratyrate gem
  ratyrate_rater

  # Associations
  has_many :ads

  validates_presence_of :first_name, message: 'não pode ficar em branco'
  validates_presence_of :last_name, message: 'não pode ficar em branco'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  def full_name
    "#{first_name} #{last_name}"
  end
end
