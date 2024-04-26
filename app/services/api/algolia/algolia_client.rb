# frozen_string_literal: true

require 'singleton'

module Api
  module Algolia
    class AlgoliaClient
      include Singleton

      attr_reader :client

      def initialize
        @client = ::Algolia::Search::Client.create(
          Figaro.env.ALGOLIA_APPLICATION_ID,
          Figaro.env.ALGOLIA_API_KEY,
        ).init_index(Figaro.env.DATASET_INDEX)
      end
    end
  end
end
