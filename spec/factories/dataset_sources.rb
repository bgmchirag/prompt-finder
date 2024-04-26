FactoryBot.define do
  factory :dataset_source do
    name { "huggingface" }
    url { "https://datasets-server.huggingface.co" }
    offset { 1 }
  end
end
