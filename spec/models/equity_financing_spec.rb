# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EquityFinancing, type: :model do
  describe 'validations' do
    subject { build(:equity_financing) }

    it { should belong_to(:company) }
    it { should have_many(:investments) }
    it { should validate_presence_of(:date) }
    it { should validate_numericality_of(:total_shares).is_greater_than_or_equal_to(0) }
  end
end
