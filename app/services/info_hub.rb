class InfoHub
  SOURCE_FILE = Rails.root.join('config', 'info_hub.yml')

  class UndefinedNode < StandardError
  end

  class UndefinedNodeKey < StandardError
  end

  class Node
    attr_reader :source

    delegate :keys, :[]=, to: :source

    def initialize(value)
      @source = value
    end

    def fetch(key)
      source.fetch(key) { raise UndefinedNodeKey, "The node doesn't contain - `#{ key }`" }
    end
    alias_method :[], :fetch
  end

  class << self
    delegate :get, :[], :fetch, :use, :to => :info_hub

    private

    def info_hub
      @info_hub ||= new
    end
  end

  def fetch(name)
    nodes.fetch(name) { raise UndefinedNode, "`#{ name }` node was asked(expected that #{ SOURCE_FILE } has key `#{ name }`)" }
  end
  alias_method :[], :fetch

  def use(name)
    yield fetch(name)
  end

  def get(*keys)
    keys.inject(self) { |hash, key| hash.fetch(key.to_sym) }
  end

  private

  def nodes
    return @nodes if @nodes

    source = YAML.load_file(SOURCE_FILE) rescue self.class.defaults

    @nodes = parse_data(source)
    verify_defaults!(self.class.defaults, @nodes)
    create_source_file unless File.exists? SOURCE_FILE
    @nodes
  end

  def verify_defaults!(default, node)
    default.keys.each do |key|
      if node.keys.include?(key)
        verify_defaults!(default[key], node[key]) if default[key].is_a? Hash
      else
        node[key] = parse_data(default[key])
      end
    end
  end

  def parse_data(source)
    if source.is_a? Hash
      source.inject({}) do |result, (key, node_source)|
        temp = {}

        if node_source.is_a? Hash
          temp = node_source.clone
          node_source.delete_if { |_, v| v.is_a? Hash }
          temp.delete_if { |_, v| !v.is_a? Hash  }
          result[key.to_sym] = Node.new(node_source.symbolize_keys)
        else
          result[key.to_sym] = node_source
        end

        temp.each { |k, v| result[key.to_sym].source.merge!(parse_data({k => v})) }

        result
      end
    else
      source
    end
  end

  def create_source_file
    File.open(SOURCE_FILE, 'w') { |f| f.write self.class.defaults.deep_stringify_keys.to_yaml }
  end

  def self.defaults
    {
        currency: {

            usd: {
                iso_name: "USD",
                to_uah: 1,
                to_eur: 1,
                to_pln: 1
            },

            uah: {
                iso_name: "UAH",
                to_usd: 1,
                to_eur: 1,
                to_pln: 1
            },

            pln: {
                iso_name: "PLN",
                to_usd: 1,
                to_uah: 1,
                to_eur: 1
            },

            eur: {
                iso_name: "EUR",
                to_usd: 1,
                to_pln: 2,
                to_uah: 3,
            }
        }
    }.freeze
  end
end
