require 'rails_helper'

RSpec.describe User, type: :model do

  # Tests: 
  # Error messages for all

  # validations
  describe 'validations' do
    it "should validate presence of username"
    it "should validate presence of balance"
    it "should validate uniqueness of username"
  end

  # associations
  describe 'associations' do
    it "should have many transactions"
  end

  # class methods
  # describe 'class methods' do
    
  # end

end
