# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DatasetUpdateWorker, type: :worker do
  describe '#perform' do
    let(:dataset_source) { instance_double(DatasetSource) }
    let(:dataset_importer) { instance_double(Api::DatasetImporters::HuggingFace) }

    before do
      allow(DatasetSource).to receive(:find_or_initialize_by).and_return(dataset_source)
      allow(Api::DatasetImporters::HuggingFace).to receive(:new).with(dataset_source).and_return(dataset_importer)
    end

    it 'imports updated dataset from HuggingFace' do
      expect(dataset_importer).to receive(:fetch).with('Gustavosta/Stable-Diffusion-Prompts')
      described_class.new.perform
    end
  end
end
