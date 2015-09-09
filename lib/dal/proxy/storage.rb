require_relative '../proxy'

class DAL::Proxy::Storage < DAL::Proxy

  def initialize(storage_layer:)
    super(proxy: storage_layer)
  end

  def storage_layer
    proxy
  end

end
