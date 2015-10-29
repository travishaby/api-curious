require 'rails_helper'

RSpec.describe Funding, type: :model, vcr: true do
  context "funding for national legislator" do
    it "exists" do
      expect(Funding).to be
    end

    it "returns national politicians total_contributions given one fec_id" do
      total_contributions = Funding.total_contributions(["H0CO04122"]) #Cory Gardner
      expect(total_contributions).to eq(11199689.0)
    end

    it "returns national politicians cash_on_hand given multiple fec_ids" do
      cash_on_hand = Funding.cash_on_hand(["H0CO04122", "H0CO04122"]) #Cory Gardner
      expect(cash_on_hand).to eq(554106.0)
    end
  end
end
