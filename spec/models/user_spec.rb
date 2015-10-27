require 'rails_helper'

RSpec.describe User, type: :model do

  context "valid user" do
    it "must have a name" do
      user = User.new(name: "Travis")

      expect(user).to be_valid
    end
  end


  context "invalid user" do
    it "must have a name" do
      user = User.new

      expect(user).to_not be_valid
    end
  end
end
