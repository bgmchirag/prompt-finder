# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dataset, type: :model do
  describe 'validations' do
    it 'validates presence of prompt' do
      dataset = build(:dataset, prompt: nil)
      expect(dataset).not_to be_valid
      expect(dataset.errors[:prompt]).to include("can't be blank")
    end
  end
end
