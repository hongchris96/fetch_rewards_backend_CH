class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: {greater_than_or_equal_to: 0}

  has_many :transactions,
    foreign_key: :payer_id,
    class_name: :Transaction

  
end
