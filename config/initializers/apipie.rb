Apipie.configure do |config|
  config.app_name                = "Loomio"
  config.api_base_url            = "/api/v1"
  config.doc_base_url            = "/api/docs"
  config.api_controllers_matcher = ["#{Rails.root}/app/controllers/api/**/*.rb", "#{Rails.root}/app/controllers/popolo/**/*.rb"]
  config.default_version         = "v1"
  config.app_info["v1"] = "v1 of the Loomio API, in use in Loomio 1.0"
  config.app_info["popolo"] = "Endpoints conforming to the popolo spec (http://www.popoloproject.com/)"
end
