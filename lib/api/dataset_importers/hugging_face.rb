# frozen_string_literal: true

module Api
  module DatasetImporters
    class HuggingFace
      attr_reader :dataset_source, :max_records, :offset, :connection

      def initialize(dataset_source)
        @dataset_source = dataset_source
        @max_records = HUGGINGFACE_PER_REQUEST_LIMIT
        @offset = dataset_source.offset || 0
        @connection = Api::HttpServiceConnection.new(@dataset_source.url).build_connection
        @remaining_records = (HUGGINGFACE_MAX_RECORD - (@offset * @max_records))
        @batches_to_fetch = (@remaining_records / @max_records)
      end

      def fetch(dataset)
        @batches_to_fetch.times do |iteration|
          response = fetch_dataset(@offset, @max_records, dataset)
          import_dataset(response["rows"]) if response.key?("rows")
          Rails.logger.info "Batch #{iteration + 1} imported successfully."
          @offset += @max_records
        end

        @dataset_source.update(offset: @offset)
      rescue StandardError => e
        @dataset_source.update(offset: @offset)
        Rails.logger.info "An error occurred during import: #{e.message}"
        false
      end

      private

      def fetch_dataset(offset, length, dataset)
        query = "dataset=#{dataset}&config=default&split=train&offset=#{offset}&length=#{length}"
        response = @connection.get("/rows?#{query}")
        JSON.parse(response.body)
      end

      def import_dataset(rows)
        datasets = rows.map { |row| { objectID: SecureRandom.uuid, prompt: row.dig("row", "Prompt") } }
        Api::Algolia::AlgoliaClient.instance.client.init_index(Figaro.env.DATASET_INDEX)
          .save_objects(datasets)
      end
    end
  end
end
