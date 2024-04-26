class DatasetSource < ApplicationRecord
  validates :name, :url, presence: true
end
