# frozen_string_literal: true

class DatasetsController < ApplicationController
  def index
    @datasets, @total_pages, @total_records = Api::Algolia::DatasetProvider.call(current_page, params[:prompt])
  end
end
