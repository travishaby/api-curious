require 'rails_helper'

RSpec.describe Address, type: :model do
  context "valid address" do
    it "must have a street, city, state, and zip_code" do
      address = Address.new(street: "3216 St. Paul St.",
                            city: "Denver",
                            state: "CO",
                            zip_code: "80205")
      expect(address).to be_valid
    end
  end


  context "invalid address" do
    it "must have a street" do
      address = Address.new(city: "Denver",
                            state: "CO",
                            zip_code: "80205")
      expect(address).to_not be_valid
    end

    it "must have a city" do
      address = Address.new(street: "3216 St. Paul St.",
                            state: "CO",
                            zip_code: "80205")
      expect(address).to_not be_valid
    end

    it "must have a state" do
      address = Address.new(street: "3216 St. Paul St.",
                            city: "Denver",
                            zip_code: "80205")
      expect(address).to_not be_valid
    end

    it "must have a zip_code" do
      address = Address.new(street: "3216 St. Paul St.",
                            city: "Denver",
                            state: "CO")
      expect(address).to_not be_valid
    end
  end
end
