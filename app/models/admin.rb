class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  scope :with_full_access, -> { where(role: :full_access) }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  enum role: %i[full_access restricted_access]

  def full_name
    "#{first_name} #{last_name}"
  end

  def role_description
    if role == 'full_access'
      'Acesso Completo'
    else
      'Acesso Restrito'
    end
  end
end
