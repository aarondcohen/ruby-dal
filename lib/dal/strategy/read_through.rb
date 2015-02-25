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
    identifier_to_instance = Hash[cache_layer
      .load_multi(identifiers: identifiers)
      .map {|i| [instance_to_identifier(i), i] }
    ]
    unloaded_identifers = identifiers.reject {|i| identifier_to_instance.has_key?(i) }
    unless unloaded_identifers.empty?
      instances = storage_layer.load_multi(identifiers: unloaded_identifers)
      cache_layer.save_multi(instances: instances)
      identifier_to_instance.merge!(Hash[instances.map {|i| [instance_to_identifier(i), i] }])
    end

    return identifiers.map {|i| identifier_to_instance[i] }.compact
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

