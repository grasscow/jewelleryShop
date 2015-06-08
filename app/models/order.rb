class Order < ActiveRecord::Base
  DELIVERY_TYPE=%w(Самовывоз Курьер)
  STATUS=%w(Получен Собирается Доставляется Доставлен)
  PAY_TYPE=%w(Карта Наличные)
  
  belongs_to :cart
  belongs_to :user
  belongs_to :address
  
  validates :cart_id, presence: true
  validates :user_id, presence: true
  validates :address_id, presence: true
  validates :dalivery_date, presence: true
  validates :delivery_type, presence: true, inclusion: {in: 0...ROLES.size}
  validates :status, presence: true, inclusion: {in: 0...ROLES.size}
  validates :pay_type, presence: true, inclusion: {in: 0...ROLES.size}
  validates :active, presence: true
end
