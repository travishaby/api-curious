require "rails_helper"

RSpec.describe SunlightService, type: :model, vcr: true do

  def service
    @service ||= SunlightService.new
  end

  context "state legislators by location" do
    it "returns bills when given a user with lat/long attributes" do
      state_legislators = service.state_legislators_by_location(user)
      expect(state_legislators.size).to eq(2)
    end
  end

  context "national legislators by location" do
    it "returns bills when given a user with lat/long attributes" do
      national_legislators = service.national_legislators_by_location(user)
      expect(national_legislators.size).to eq(3)
    end
  end

  context "state bills request" do
    it "returns bills when given a legislators leg_id" do
      bills = service.state_bills("COL000034") #Michael Johnston
      expect(bills.size).to eq(82)
    end
  end

  context "national bills request" do
    it "returns bills when given a legislators bioguide_id" do
      bills = service.national_bills("G000562") #Cory Gardner
      expect(bills.size).to eq(20)
    end
  end

  context "national funding request" do
    it "returns funding for a given candidate given an fec_id" do
      total_contributions = service.
        national_legislator_funding("H0CO04122")[:total_contributions]
          #Cory Gardner
      expect(total_contributions).to eq(135135346)
    end
  end

end
