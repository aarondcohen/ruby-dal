require_relative '../strategy'

class DAL::Strategy::ReadThrough < DAL::Strategy

  def load(identifier:)
    instance = cache_layer.load(identifier: identifier)

    unless instance
      instance = storage_layer.load(identifier: identifier)
      cache_layer.save(instance: instance)
    end

    return instance
  end

  def load_multi(identifiers:)

    cached_instances = cache_layer.load_multi(identifiers: identifiers)
    uncached_identifers = identifiers - to_ids(cached_instances)
    stored_instances = []

    unless uncached_identifers.empty?
      stored_instances = storage_layer.load_multi(identifiers: uncached_identifers)
      cache_layer.save_multi(instances: stored_instances)
    end

    return cached_instances + stored_instances
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
    cache_layer.delete(instance: instance)

    return
  end

  def save_multi(instances:)
    storage_layer.save_multi(instances: instances)
    cache_layer.delete_multi(instances: instances)

    return
  end

end

