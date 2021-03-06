class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :price, presence: true, numericality: {greater_than: 0}

  def total_price
    quantity*price
  end
end
