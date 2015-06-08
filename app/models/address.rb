class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  
  validates :country, presence: true
  validates :locality, presence: true
  validates :index, presence: true
  validates :addres_line, presence: true
  validates :user_id, presence: true
end
