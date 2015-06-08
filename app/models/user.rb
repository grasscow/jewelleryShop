class User < ActiveRecord::Base
  has_secure_password
  has_many :addresses, dependent: :nullify
  has_many :orders, dependent: :nullify
end
