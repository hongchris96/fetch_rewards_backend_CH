require 'rails_helper'

RSpec.describe User, type: :model do
  # Tests: 
  # Error messages for all

  subject(:dummy) { User.new(username: "Bunshin", balance: 100)}

  # validations
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:balance)}
    it {should validate_uniqueness_of(:username)}
    it "should validate balance doesn't go below zero" do
      negative_balance = User.new(username: "SubZero", balance: -100)
      negative_balance.valid?
      expect(negative_balance.errors[:balance]).to eq(["must be greater than or equal to 0"])
    end
  end

  # associations
  describe 'associations' do
    it {should have_many(:transactions)}
  end

  # class methods
  # describe 'class methods' do
    
  # end

end
