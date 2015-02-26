require_relative '../strategy'

class DAL::Strategy::WriteThrough < DAL::Strategy::ReadThrough
  def save(instance:)
    storage_layer.save(instance: instance)
    cache_layer.save(instance: instance)

    return
  end

  def save_multi(instances:)
    storage_layer.save_multi(instances: instances)
    cache_layer.save_multi(instances: instances)

    return
  end

end
