# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Algolia::DatasetProvider do
  describe '#call' do
    let(:page_number) { 1 }
    let(:prompt) { 'some prompt' }
    let(:datasets) { [{ id: 1, name: 'Dataset 1' }, { id: 2, name: 'Dataset 2' }] }
    let(:total_pages) { 3 }
    let(:response) { { hits: datasets, nbPages: total_pages } }

    before do
      allow(Algolia::Search::Client).to receive(:create).and_return(double(init_index: double(search: response)))
    end

    it 'returns datasets and total pages' do
      provider = described_class.new(page_number, prompt)
      returned_datasets, returned_total_pages = provider.call
      expect(returned_datasets).to eq(datasets)
      expect(returned_total_pages).to eq(total_pages)
    end
  end
end
