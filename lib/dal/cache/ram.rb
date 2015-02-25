require_relative '../cache'

class DAL::Cache::RAM < DAL::Cache

  def initialize
    clear
  end

  def load(identifier:)
    @cache[identifier]
  end

  def save(instance:)
    @cache[to_id(instance)] = instance
  end

  def delete(instance:)
    @cache.delete(to_id(instance))
  end

  def clear
    @cache = []
  end

end
