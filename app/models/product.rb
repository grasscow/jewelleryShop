class Product < ActiveRecord::Base
    has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100"}
    belongs_to :category
    has_many :line_items, dependent: :nullify
    
    validates :name, presence: true, length: {maximum: 200}
    validates :price, presence: true, numericality: {greater_than: 0}
    validates :category_id, presence: true
    validates_attachment :image, content_type: {content_type: /\Aimage\//}
    validates :amount, presence: true, numericality: {greater_than: 0}
end
