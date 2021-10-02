require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with validations' do
    it 'is not valid without email' do
      user = described_class.new
      user.email = nil
      user.username = 'test123'
      user.first_name = 'Juan'

      expect(user).not_to be_valid
    end

    it 'is not valid without username' do
      user = described_class.new
      user.email = 'test@test.com'
      user.username = nil
      user.first_name = 'Juan'

      expect(user).not_to be_valid
    end

    it 'is not valid without first_name' do
      user = described_class.new
      user.email = 'test@test.com'
      user.username = 'test123'
      user.first_name = nil

      expect(user).not_to be_valid
    end

    it 'is not valid without last_name' do
      user = described_class.new
      user.email = 'test@test.com'
      user.last_name = nil

      expect(user).not_to be_valid
    end

  end
end
