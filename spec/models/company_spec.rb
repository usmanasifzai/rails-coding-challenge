# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    subject { build(:company) }

    it { should have_many(:equity_financings) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:founded) }
  end
end
