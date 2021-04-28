require 'rails_helper'

RSpec.describe User, type: :model do
  # let (:user1) {User.new (username: "",password: "123456")}
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  subject (:user1) {User.create(username: "Capy", password: "123456")}
  it { should validate_uniqueness_of(:username) }


  describe "#is_password?" do
    # it "check if user exist with given password" do 
      context "when password matches with given password" do
        it "should return true" do
          expect(FactoryBot.create(:user).is_password?("123456")).to be(true)
        end
      end
      context "when password does not match with given password" do
        it "should return false" do
          expect(FactoryBot.create(:user).is_password?("763443")).to be(false)
        end
      end
    # end  
  end 

  describe "#reset_session_token!" do
    it "should reset session token" do
      old_token = user1.session_token
      user1.reset_session_token!
      expect(user1.session_token).to_not eq(old_token)
    end
    it "should return new session token" do
      expect(user1.reset_session_token!).to eq(user1.session_token)
    end
  end

  describe "#session_token" do
    it "should assign session token if none given" do
      expect(FactoryBot.create(:user).session_token).to_not be_nil
    end
  end

  describe "::find_by_credentials" do
    before { user1.save! }
    it "should return user with correct password" do
      expect(User.find_by_credentials("Capy", "123456")).to eq(user1)
    end
    it "should return nil with incorrect password" do
      expect(User.find_by_credentials("Harry Potter", "password")).to eq(nil)
    end
  end

  describe "password encryption" do 
    it "does not save passwords to the database" do 
      # FactoryBot.create(:user, username: 'Harry Potter') 
      FactoryBot.create(:harry_potter)
      user = User.find_by(username: "Harry Potter")
      expect(user.password).not_to eq("123456")
    end

    it "encrypts password using BCrypt" do 
      expect(BCrypt::Password).to receive(:create).with("password")
      FactoryBot.build(:user, password: "password")
    end
  end

end
