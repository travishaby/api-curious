require 'rails_helper'

RSpec.describe Legislator, type: :model do
  context "valid legislator" do
    it "must have a full_name and leg_id" do
      legislator = Legislator.create(full_name: "Travis",
                                        leg_id: "123456")

      expect(legislator).to be_valid
    end
  end

  context "invalid legislator" do
    it "must be unique" do
      Legislator.create(full_name: "Travis",
                           leg_id: "123456")

      legislator = Legislator.new(full_name: "Travis",
                                     leg_id: "123456")

      expect(legislator).to be_invalid
    end
  end
end
