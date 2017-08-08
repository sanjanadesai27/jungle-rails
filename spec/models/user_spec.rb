require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it {should validate_uniqueness_of(:email).case_insensitive}
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
  end
  
  describe '.authenticate_with_credentials' do
    before :each do 
      @user = User.create(
        first_name: "joe",
        last_name: 'bro',
        email: "joe@bro.yo",
        password:"brobrobro"
      ) 
      # @user
    end  
    
    it "should return an instance of a user" do
      user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to be_an_instance_of(User)
      expect(user.email).to eq(@user.email)
    end
    
    it "should return nil if email is incorrect" do
      user = User.authenticate_with_credentials("bademail", @user.password)
      expect(user).to be(nil)
    end
    
    it "should return nil if password is incorrect" do
      user = User.authenticate_with_credentials(@user.email, "badpass")
      expect(user).to be(nil)
    end
    
  end

end
  