class Cart < ActiveRecord::Base
  has_one :order, dependent: :destroy
  has_many :line_items
end
