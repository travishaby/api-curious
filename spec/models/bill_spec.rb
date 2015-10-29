require 'rails_helper'

RSpec.describe Bill, type: :model, vcr: true do
  context "bills for national legislator" do
    it "exists" do
      expect(Bill).to be
    end

    it "returns national politicians bills with where" do
      bills = Bill.where(bioguide_id: "G000562") #Cory Gardner
      expect(bills.count).to eq(20)
    end
  end
end
