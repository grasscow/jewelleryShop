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
  validates :delivery_type, presence: true, inclusion: {in: 0...DELIVERY_TYPE.size}
  validates :status, presence: true, inclusion: {in: 0...STATUS.size}
  validates :pay_type, presence: true, inclusion: {in: 0...PAY_TYPE.size}
  validates :active, presence: true


  validate :check_cart
  scope :ordering, ->{order(created_at: :desc)}

  def check_cart
    if cart&&cart.line_items.blank?
      errors/add(:cart, 'пуста')
    end
  end
end
