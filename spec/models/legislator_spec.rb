require 'rails_helper'

RSpec.describe Legislator, type: :model do
  context "valid legislator" do
    it "must have a full_name and leg_id" do
      legislator = Legislator.create(first_name: "Travis",
                                   votesmart_id: "123456")

      expect(legislator).to be_valid
    end
  end

  context "invalid legislator" do
    it "must be unique" do
      Legislator.create(first_name: "Travis",
                      votesmart_id: "123456")

      legislator = Legislator.new(first_name: "Travis",
                                votesmart_id: "123456")

      expect(legislator).to be_invalid
    end
  end

  context "fec_ids are taken in as a string" do
    it "parses fec_ids" do
      legislator = Legislator.create(first_name: "Travis",
                                   votesmart_id: "111111",
                                        fec_ids: "[\"H6CO01141\"\,\"H6CO01141\"]")

      expect(legislator.parsed_fec_ids).to eq(["H6CO01141", "H6CO01141"])
    end
  end
end
