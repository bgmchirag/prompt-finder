# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DatasetsController, type: :controller do
  describe 'GET #index' do
    let(:datasets) { [{ id: 1, name: 'Dataset 1' }, { id: 2, name: 'Dataset 2' }] }
    let(:total_pages) { 3 }

    before do
      allow(Api::Algolia::DatasetProvider).to receive(:call).and_return([datasets, total_pages])
    end

    it 'assigns datasets and total_pages' do
      get :index
      expect(assigns(:datasets)).to eq(datasets)
      expect(assigns(:total_pages)).to eq(total_pages)
    end
  end
end
