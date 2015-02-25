require_relative '../dal'

class DAL::Strategy < DAL

  attr_reader %i{ cache_layer storage_layer }

  def initialize(cache_layer:, storage_layer:)
    @cache_layer = cache_layer
    @storage_layer = storage_layer
  end

end
