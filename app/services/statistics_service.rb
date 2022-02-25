# frozen_string_literal: true

class StatisticsService
  def initialize(fund)
    @fund= fund
  end

  def median_founded_date_of_companies
    companies = Company.includes(equity_financings:{ investments: :fund}).where(funds: { id: @fund.id })
    return nil if companies.empty?

    dates = companies.pluck(:founded)
    total_dates = dates.size
    if dates.size.odd?
      median = dates[total_dates/2]
    elsif dates.size.even?
      median = avg_date(dates,total_dates)
    end
  end 

  def average_current_ownership_of_companies
    investments = @fund.investments 
    ownerships = investments.map{|investment|owned_shares(investment)/total_shares(investment)}
    return nil if ownerships.empty?
    
    average_ownership = ownerships.reduce(:+) / ownerships.size
    average_ownership
  end

  private
  def owned_shares investment
    investment.shares.to_f
  end

  def total_shares investment
    company = investment.equity_financing.company
    equity_financing = company.equity_financings.order(date: :desc).first
    equity_financing.total_shares.to_f
  end

  def avg_date(dates,size)
    center = size/2
    middle_left_date_day = dates[center-1].strftime("%d").to_i
    middle_right_date_day = dates[center].strftime("%d").to_i
    median_day = (middle_left_date_day + middle_left_date_day) / 2
    median_date = dates[center-1] + median_day
  end
end
