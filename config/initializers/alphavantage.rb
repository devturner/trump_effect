require 'alphavantagerb'

@alpha_config_path = Rails.root.join('config/alpha.yml').to_s

if File.exist?(@alpha_config_path)
 	alpha_config = YAML.load_file(@alpha_config_path).with_indifferent_access
	@alpha_client = Alphavantage::Client.new key: alpha_config[:key]
else
  # Rails.logger.warn(%Q(Desk configuration not found! No file at "#{config_path}".))
  puts (%Q(Alphavantage configuration not found! No file at "#{config_path}".))
end
