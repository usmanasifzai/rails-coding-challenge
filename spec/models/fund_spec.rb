# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fund, type: :model do
  describe 'validations' do
    subject { build(:fund) }

    it { should have_many(:investments) }
    it { should validate_uniqueness_of(:name) }
  end
end
