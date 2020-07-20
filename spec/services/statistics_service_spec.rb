# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatisticsService do
  describe '#median_founded_date_of_companies' do
    it 'returns the middle date when there are an odd number of dates' do
      first_company = create(:company, founded: Date.new(2010, 1, 1))
      second_company = create(:company, founded: Date.new(2010, 1, 2))
      third_company = create(:company, founded: Date.new(2010, 1, 3))
      fund = create(:fund)
      first_equity_financing = create(:equity_financing, company: first_company)
      second_equity_financing = create(:equity_financing, company: second_company)
      third_equity_financing = create(:equity_financing, company: third_company)
      _first_investment = create(:investment, fund: fund, equity_financing: first_equity_financing)
      _second_investment = create(:investment, fund: fund, equity_financing: second_equity_financing)
      _third_investment = create(:investment, fund: fund, equity_financing: third_equity_financing)

      result = described_class.new(fund).median_founded_date_of_companies

      expect(result).to eq(Date.new(2010, 1, 2))
    end

    it 'returns the average of the two middle dates when there are an even number of dates' do
      first_company = create(:company, founded: Date.new(2010, 1, 1))
      second_company = create(:company, founded: Date.new(2010, 1, 3))
      fund = create(:fund)
      first_equity_financing = create(:equity_financing, company: first_company)
      second_equity_financing = create(:equity_financing, company: second_company)
      _first_investment = create(:investment, fund: fund, equity_financing: first_equity_financing)
      _second_investment = create(:investment, fund: fund, equity_financing: second_equity_financing)

      result = described_class.new(fund).median_founded_date_of_companies

      expect(result).to eq(Date.new(2010, 1, 2))
    end

    it 'returns nil if the fund has not invested in any companies' do
      fund = create(:fund)

      result = described_class.new(fund).median_founded_date_of_companies

      expect(result).to be_nil
    end

    it 'does not include companies that the fund did not invest in' do
      fund = create(:fund)
      _irrelevant_investment = create(:investment)

      result = described_class.new(fund).median_founded_date_of_companies

      expect(result).to be_nil
    end
  end

  describe '#average_current_ownership_of_companies' do
    it 'returns the average ownership percentage of companies in which the fund has invested' do
      fund = create(:fund)
      first_equity_financing = create(:equity_financing, total_shares: 1_000_000)
      second_equity_financing = create(:equity_financing, total_shares: 1_000_000)
      _first_investment = create(:investment, fund: fund, equity_financing: first_equity_financing, shares: 750_000)
      _second_investment = create(:investment, fund: fund, equity_financing: second_equity_financing, shares: 250_000)

      result = described_class.new(fund).average_current_ownership_of_companies

      expect(result).to eq(0.5)
    end

    it 'returns nil if the fund has not invested in any companies' do
      fund = create(:fund)

      result = described_class.new(fund).average_current_ownership_of_companies

      expect(result).to be_nil
    end

    it 'does not include ownership in companies in which the fund did not invest' do
      fund = create(:fund)
      _irrelevant_investment = create(:investment)

      result = described_class.new(fund).average_current_ownership_of_companies

      expect(result).to eq(nil)
    end

    it "takes all investments for the same company into account and uses the latest financing's total_shares" do
      fund = create(:fund)
      company = create(:company)
      first_equity_financing = create(
        :equity_financing,
        date: Date.new(2010, 1, 1),
        company: company,
        total_shares: 1_000_000
      )
      second_equity_financing = create(
        :equity_financing,
        date: Date.new(2010, 1, 2),
        company: company,
        total_shares: 2_000_000
      )
      _first_investment = create(:investment, fund: fund, equity_financing: first_equity_financing, shares: 750_000)
      _second_investment = create(:investment, fund: fund, equity_financing: second_equity_financing, shares: 250_000)

      result = described_class.new(fund).average_current_ownership_of_companies

      expect(result).to eq(0.5)
    end
  end
end
