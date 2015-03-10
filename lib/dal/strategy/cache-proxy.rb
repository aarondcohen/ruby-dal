require_relative '../strategy'

class DAL::Strategy::CacheProxy < DAL::Strategy
  def load(identifier:)        cache_layer.load(identifier: identifier);         end
  def load_multi(identifiers:) cache_layer.load_multi(identifiers: identifiers); end
  def reload(instance:)        cache_layer.reload(instance: instance);           end
  def reload_multi(instances:) cache_layer.reload_multi(instances: instances);   end
  def save(instance:)          cache_layer.save(instance: instance);             end
  def save_multi(instances:)   cache_layer.save_multi(instances: instances);     end
  def delete(instance:)        cache_layer.delete(instance: instance);           end
  def delete_multi(instances:) cache_layer.delete_multi(instances: instances);   end
end
