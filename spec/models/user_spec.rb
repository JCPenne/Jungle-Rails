require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'creates a new user when all required fields are filled out' do
      user = User.new(
        first_name: "First",
        last_name: "Last", 
        email: "test@test.com",
        password: 'Book', 
        password_confirmation: 'Book'
        )
      user.save
      
      expect(user).to be_valid
    end
    it 'does not create a new user if password does not match password_confirmation' do
      user = User.new(
        first_name: "First",
        last_name: "Last", 
        email: "test@test.com",
        password: 'Book', 
        password_confirmation: ''
        )
      user.save
      
      expect(user).to_not be_valid
    end
    it 'does not create a new user if password is empty' do
      user = User.new(
        first_name: "First",
        last_name: "Last", 
        email: "test@test.com",
        password: '', 
        password_confirmation: 'Book'
        )
      user.save
      
      expect(user).to_not be_valid
    end
    it 'does not create a new user if password_confirmation is empty' do
      user = User.new(
        first_name: "First",
        last_name: "Last", 
        email: "test@test.com",
        password: 'Book', 
        password_confirmation: ''
        )
      user.save
      
      expect(user).to_not be_valid
    end
    it 'does not create a new user if email is not unique' do
      user1 = User.new(
        first_name: "First",
        last_name: "Last", 
        email: "email@email.com",
        password: 'Book', 
        password_confirmation: 'Book'
        )
      user1.save
      user2 = User.new(
        first_name: "First",
        last_name: "Last", 
        email: "email@email.com",
        password: 'Book', 
        password_confirmation: 'Book'
        )
      user2.save
      
      expect(user2).to_not be_valid
    end
    it 'does not create a new user if first_name is empty' do
      user = User.new(
        first_name: "",
        last_name: "Last", 
        email: "test@test.com",
        password: 'Book', 
        password_confirmation: ''
        )
      user.save
      
      expect(user).to_not be_valid
    end
    it 'does not create a new user if last_name is empty' do
      user = User.new(
        first_name: "First",
        last_name: "", 
        email: "test@test.com",
        password: 'Book', 
        password_confirmation: ''
        )
      user.save
      
      expect(user).to_not be_valid
    end
    it 'does not create a new user if email is empty' do
      user = User.new(
        first_name: "",
        last_name: "Last", 
        email: "",
        password: 'Book', 
        password_confirmation: ''
        )
      user.save
      
      expect(user).to_not be_valid
    end


  end
end
