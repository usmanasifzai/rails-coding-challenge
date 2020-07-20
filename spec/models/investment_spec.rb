# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Investment, type: :model do
  describe 'validations' do
    subject { build(:investment) }

    it { should belong_to(:fund) }
    it { should belong_to(:equity_financing) }
    it { should validate_numericality_of(:shares).is_greater_than(0) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
  end
end
