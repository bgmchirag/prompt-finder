# frozen_string_literal: true

module Api
  module Algolia
    class Base
      def self.call(*args)
        new(*args).call
      end
    end
  end
end
