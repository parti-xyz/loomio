require [Rails.root, :plugins, :base].join('/')
Dir.glob('plugins/*/plugin.rb').each { |plugin_file| require [Rails.root, plugin_file].join('/') }
Loomio::Plugins::Repository.install_plugins!
