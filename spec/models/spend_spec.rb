require 'rails_helper'

RSpec.describe Spend, type: :model do
  # validations
  describe 'validations' do
    it {should validate_presence_of(:points_req)}
  end
end
