require_relative '../proxy'

class DAL::Proxy::Cache < DAL::Proxy

  def initialize(cache_layer:)
    super(proxy: cache_layer)
  end

  def cache_layer
    proxy
  end

end
