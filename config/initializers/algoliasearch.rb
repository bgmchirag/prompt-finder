AlgoliaSearch.configuration = {
  application_id: Figaro.env.ALGOLIA_APPLICATION_ID,
  api_key: Figaro.env.ALGOLIA_API_KEY,
  connect_timeout: 2,
  receive_timeout: 30,
  send_timeout: 30,
  batch_timeout: 120,
  search_timeout: 5,
}
