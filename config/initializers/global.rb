Global.configure do |config|
  config.environment = App.env
  config.config_directory = App.root.join('config/global').to_s
end
