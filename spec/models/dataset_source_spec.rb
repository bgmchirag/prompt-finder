# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DatasetSource, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      dataset_source = build(:dataset_source, name: nil)
      expect(dataset_source).not_to be_valid
      expect(dataset_source.errors[:name]).to include("can't be blank")
    end
    it 'validates presence of url' do
      dataset_source = build(:dataset_source, url: nil)
      expect(dataset_source).not_to be_valid
      expect(dataset_source.errors[:url]).to include("can't be blank")
    end
  end
end
