# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::DatasetImporters::HuggingFace do
  describe '#fetch' do
    let!(:dataset_source) { create(:dataset_source, offset: 7000) }
    let(:dataset_api_response) do
      Api::DatasetImporters::HuggingFace.new(dataset_source).fetch('Gustavosta/Stable-Diffusion-Prompts')
    end
    let(:invalid_dataset_api_response) { Api::DatasetImporter.new.fetch('') }

    it "can fetch & parse dataset" do
      expect(dataset_api_response).to be_truthy
    end
  end
end
