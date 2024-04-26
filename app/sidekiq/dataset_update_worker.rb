class DatasetUpdateWorker
  include Sidekiq::Job
  sidekiq_options retry: 0

  def perform
    # Import Updated Dataset
    dataset_source = DatasetSource.find_or_initialize_by(name: "huggingface", url: "https://datasets-server.huggingface.co")
    Api::DatasetImporters::HuggingFace.new(dataset_source).fetch('Gustavosta/Stable-Diffusion-Prompts')
  end
end
