require_relative '../strategy'

class DAL::Strategy::ReadBehind < DAL::Strategy

  def _load(identifier)
    return cache_layer._load(identifier)
  end

  def _load_multi(identifiers)
    return cache_layer._load_multi(identifiers)
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
    storage_layer._save(instance)
    #TODO: enqueue write to cache

    return
  end

  def _save_multi(instances)
    storage_layer._save_multi(instances)
    #TODO: enqueue writes to cache

    return
  end

end
