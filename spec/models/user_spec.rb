require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'creates a new user when all required fields are filled out' do
      user = User.new(password: 'Book', password_confirmation: nil)
      user.save
      
      expect(user.errors.full_messages).to include('Test')
    end
  
  
  
  end
end
