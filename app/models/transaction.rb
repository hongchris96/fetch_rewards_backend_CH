class Transaction < ApplicationRecord
  validates :payer_id, :points, :created_at, presence: true
  
  belongs_to :payer,
    foreign_key: :payer_id,
    class_name: :User
  
end
