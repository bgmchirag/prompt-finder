# frozen_string_literal: true

class Dataset < ApplicationRecord
  validates :prompt, presence: true
end
