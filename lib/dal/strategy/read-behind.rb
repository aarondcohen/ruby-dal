require_relative '../strategy'

class DAL::Strategy::ReadBehind < DAL::Strategy

  def load(identifier)
    return cache_layer.load(identifier)
  end

  def load_multi(identifiers)
    return cache_layer.load_multi(identifiers)
  end

  def delete(instance)
    storage_layer.delete(instance)
    cache_layer.delete(instance)

    return
  end

  def delete_multi(instances)
    storage_layer.delete_multi(instances)
    cache_layer.delete_multi(instances)

    return
  end

  def save(instance)
    storage_layer.save(instance)
    #TODO: enqueue write to cache

    return
  end

  def save_multi(instances)
    storage_layer.save_multi(instances)
    #TODO: enqueue writes to cache

    return
  end

end
