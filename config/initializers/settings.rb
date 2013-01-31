SETTINGS = YAML.load_file("#{Rails.root.to_s}/config/settings.yml")
devices= YAML.load_file("#{Rails.root.to_s}/config/devices.yml")
OURDEVICES = Hash[SETTINGS[:devices].map do |our_name, device_name|
  [our_name, devices[device_name]]
end]
NUMBER_OF_DEVICES = OURDEVICES.length
OURDEVICES_ARRAY = OURDEVICES.to_a
