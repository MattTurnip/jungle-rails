require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { User.new(
                      name: "Mr. Burns",
                      email: "burns@email.com",
                      password: "password",
                      password_confirmation: "password"
                      )
  }
  
  describe 'Validations' do

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    
    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without password confirmation' do
      subject.password_confirmation = "boguspassword"
      expect(subject).to_not be_valid
    end

    it 'is not valid when password is under 6 characters' do
      subject.password = "pass"
      expect(subject).to_not be_valid
    end

    it 'is not valid when emails has been taken (not case sensitive)' do
      new_user = User.create(
                          name: "Mr. Burns", 
                          email: "BUrnS@email.com", 
                          password: "password", 
                          password_confirmation: "password"
                          )
      expect(subject).to_not be_valid
    end
  end


  describe '.authenticate_with_credentials'do
  
  it 'is not valid when passed non-existant email' do
    expect(User.authenticate_with_credentials("fake@email.com", "badpassword")).to be_nil
  end
  
  it 'is valid when passed existing email and password' do
    subject.save
    expect(User.authenticate_with_credentials("bdfurns@email.com", "password")).to_not be_nil
  end

  end
end
