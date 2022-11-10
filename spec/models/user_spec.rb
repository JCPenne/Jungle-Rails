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
      
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
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
      
      expect(user.errors.full_messages).to include("Password can't be blank")
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
      
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
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
      
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    it 'does not create a new user if first_name is empty' do
      user = User.new(
        first_name: "",
        last_name: "Last", 
        email: "test@test.com",
        password: 'Book', 
        password_confirmation: 'Book'
        )
      user.save
      
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'does not create a new user if last_name is empty' do
      user = User.new(
        first_name: "First",
        last_name: "", 
        email: "test@test.com",
        password: 'Book', 
        password_confirmation: 'Book'
        )
      user.save
      
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'does not create a new user if email is empty' do
      user = User.new(
        first_name: "First",
        last_name: "Last", 
        email: "",
        password: 'Book', 
        password_confirmation: 'Book'
        )
      user.save
      
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'does not create a new user if password is too short' do
      user = User.new(
        first_name: "First",
        last_name: "Last", 
        email: "test@test.com",
        password: 'Boo', 
        password_confirmation: 'Boo'
        )
      user.save
      
      expect(user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end
  end

    
    
    describe ".authenticate-with-credentials" do
      it 'allows a user to login if they provide matching credentials' do
        user = User.new(
          first_name: "First",
          last_name: "Last",
          email: "first@last.com",
          password: "Book",
          password_confirmation: "Book"
        )
        user.save

        authenticate = User.authenticate_with_credentials(user.email, user.password)

        expect(authenticate).to eql(user)
      end
      it 'does not allow a user to login if they provide non-matching credentials' do
        user = User.new(
          first_name: "First",
          last_name: "Last",
          email: "first@last.com",
          password: "Book",
          password_confirmation: "Book"
        )
        user.save

        authenticate = User.authenticate_with_credentials(user.email, "Boo")

        expect(authenticate).to_not eql(user)
      end
      it 'allows a user to login regardless of whitespace before or after email address' do
        user = User.new(
          first_name: "First",
          last_name: "Last",
          email: "first@last.com",
          password: "Book",
          password_confirmation: "Book"
        )
        user.save

        authenticate = User.authenticate_with_credentials("   first@last.com", user.password)

        expect(authenticate).to eql(user)
      end
      it 'allows a user to login regardless of casing of email address' do
        user = User.new(
          first_name: "First",
          last_name: "Last",
          email: "first@last.com",
          password: "Book",
          password_confirmation: "Book"
        )
        user.save

        authenticate = User.authenticate_with_credentials("FIRST@last.com", user.password)

        expect(authenticate).to eql(user)
      end
    end


end