require_relative '../strategy'

class DAL::Strategy::WriteBehind < DAL::Strategy
  def _load(identifier)
    instance = cache_layer._load(identifier)

    unless instance
      instance = storage_layer._load(identifier)
      cache_layer._save(instance)
    end

    return instance
  end

  def _load_multi(identifiers)
    cached_instances = cache_layer._load_multi(identifiers)
    uncached_identifers = identifiers - to_identifiers(cached_instances)

    stored_instances = []
    unless uncached_identifers.empty?
      stored_instances = storage_layer._load_multi(uncached_identifers)
      cache_layer._save_multi(stored_instances)
    end

    return cached_instances + stored_instances
  end

  def _delete(instance)
    storage_layer._delete(instance)
    cache_layer._delete(instance)

    return
  end

  def _delete_multi(instances)
    storage_layer._delete_multi(instances)
    cache_layer._delete_multi(instances)

    return
  end

  def _save(instance)
    cache_layer._save(instance)
    #TODO: enqueue write to storage

    return
  end

  def _save_multi(instances)
    cache_layer._save_multi(instances)
    #TODO: enqueue writes to storage

    return
  end

end
