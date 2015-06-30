class CurrencyCreatorService
  SOURCE_FILE = Rails.root.join('config', 'info_hub.yml')
  attr_reader :params

  def self.create!(params)
    new(params).create!
  end

  def initialize(params)
    @params = params
  end

  def create!
    data = YAML.load_file SOURCE_FILE
    data['currency-test'] = params.to_a
    File.open(SOURCE_FILE, 'w') { |f| YAML.dump(data, f) }
  end
end