class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Scopes
  scope :with_full_access, -> { where(role: :full_access) }
  scope :with_restricted_access, -> { where(role: :restricted_access) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  # Enums
  enum role: %i[full_access restricted_access]

  def full_name
    "#{first_name} #{last_name}"
  end
end
