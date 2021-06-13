class Transaction < ApplicationRecord
  validates :payer_id, :points, presence: true
  
  belongs_to :payer,
    foreign_key: :payer_id,
    class_name: :User
  
end
