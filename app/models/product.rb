class Product < ActiveRecord::Base
    has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100", small: "200x200"}
    belongs_to :category
    has_many :line_items, dependent: :nullify
    
    validates :name, presence: true, length: {maximum: 200}
    validates :price, presence: true, numericality: {greater_than: 0}
    validates :category_id, presence: true
    validates_attachment :image, content_type: {content_type: /\Aimage\//}
    validates :amount, presence: true, numericality: {greater_than: 0}



    before_validation :set_default_category

    def admin?
        role==1
    end

    private

    def set_default_category
        q = Category.where("name like ?", "Без категории")
        self.category ||= q.id
    end

end
