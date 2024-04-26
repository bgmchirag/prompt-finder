# frozen_string_literal: true

module Api
  class HttpServiceConnection
    def initialize(url)
      @url = url
    end

    def build_connection
      @connection = Faraday.new(url: @url) do |faraday|
        faraday.options.open_timeout = 10
        faraday.options.timeout = 120
        faraday.ssl.verify = false
        faraday.adapter Faraday.default_adapter
      end
    rescue StandardError => e
      Rails.logger.info(e.message)
      raise "Error" unless @connection
    end
  end
end
