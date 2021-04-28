require 'rails_helper'

RSpec.describe User, type: :model do
  # let (:user1) {User.new (username: "",password: "123456")}
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  subject (:user1) {User.create(username: "Capy", password: "123456")}
  it { should validate_uniqueness_of(:username) }


  describe "#is_password?" do
    it "check if user exist with given password" do 
      context "when password matches with given password"
      expect(FacotryBot.create(:user).is_password?("123456")).to be(true)
    end  

  end 
end
