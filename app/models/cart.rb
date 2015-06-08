class Cart < ActiveRecord::Base
  has_one :order, dependent: :destroy
  has_many :line_items, ->{includes(:product).order(:created_at)}, dependent: :destroy
end
