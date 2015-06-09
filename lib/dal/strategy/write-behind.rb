require_relative '../strategy'

class DAL::Strategy::WriteBehind < DAL::Strategy::ReadThrough
  def save(instance:)
    cache_layer.save(instance: instance)
    storage_layer.save(instance: instance)

    return
  end

  def save_multi(instances:)
    cache_layer.save_multi(instances: instances)
    storage_layer.save_multi(instances: instances)

    return
  end

end
