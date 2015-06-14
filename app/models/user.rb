class User < ActiveRecord::Base
  ROLES=%w(Пользователь Администратор)
  has_secure_password
  has_many :addresses, dependent: :nullify
  has_many :orders, dependent: :nullify
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :password, length: {minimum: 6, if: 'password.present?'}, presence: {on: :create}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :role, presence: true, inclusion: {in: 0...ROLES.size}
  validates :m_phone, presence: true, length: {is: 12}
  validates :gender, length: {is: 1},  presence: true,inclusion: { in: %w(м ж) }


  before_validation :set_default_role

  def admin?
    role==1
    end

private

  def set_default_role
    self.role ||= 0
  end
  
end
