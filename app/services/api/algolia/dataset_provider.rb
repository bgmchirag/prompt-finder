# frozen_string_literal: true

module Api
  module Algolia
    class DatasetProvider < Base
      def initialize(page, prompt)
        super()
        @page = page
        @prompt = prompt
      end

      attr_reader :page, :prompt

      def call
        response = Api::Algolia::AlgoliaClient.instance.client
          .search(prompt, page:, hitsPerPage: DATASET_LIMIT)

        [response[:hits], response[:nbPages], response[:nbHits]]
      rescue StandardError => e
        Rails.logger.info "An error occurred during import: #{e.message}"
        [[], 0, 0]
      end
    end
  end
end
