require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # Tests: 
  # Error messages for all

  # validations
  describe 'validations' do
    it {should validate_presence_of(:payer_id)}
    it {should validate_presence_of(:points)}
    it {should validate_presence_of(:created_at)}
  end

  # associations
  describe 'associations' do
    it { should belong_to(:payer) }
  end


end
