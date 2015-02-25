require_relative '../cache'

class DAL::Cache::PickledRAM < DAL::Cache

  def initialize
    clear
  end

  def load(identifier:)
    value = @cache[identifier]
    value ? Marshal.load(value) : nil
  end

  def save(instance:)
    @cache[to_id(instance)] = Marshal.dump(instance)

    return
  end

  def delete(instance:)
    @cache.delete(to_id(instance))

    return
  end

  def clear
    @cache = []
  end

end
