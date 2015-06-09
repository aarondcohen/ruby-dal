require_relative '../strategy'

class DAL::Strategy::ReadBehind < DAL::Strategy

  def load(identifier:)
    return cache_layer.load(identifier: identifier)
  end

  def load_multi(identifiers:)
    return cache_layer.load_multi(identifiers: identifiers)
  end

  def delete(instance:)
    storage_layer.delete(instance: instance)
    cache_layer.delete(instance: instance)

    return
  end

  def delete_multi(instances:)
    storage_layer.delete_multi(instances: instances)
    cache_layer.delete_multi(instances: instances)

    return
  end

  def save(instance:)
    storage_layer.save(instance: instance)

    return
  end

  def save_multi(instances:)
    storage_layer.save_multi(instances: instances)

    return
  end

end

