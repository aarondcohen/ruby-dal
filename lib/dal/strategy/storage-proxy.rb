require_relative '../strategy'

class DAL::Strategy::StorageProxy < DAL::Strategy
  def load(identifier:)        storage_layer.load(identifier: identifier);         end
  def load_multi(identifiers:) storage_layer.load_multi(identifiers: identifiers); end
  def reload(instance:)        storage_layer.reload(instance: instance);           end
  def reload_multi(instances:) storage_layer.reload_multi(instances: instances);   end
  def save(instance:)          storage_layer.save(instance: instance);             end
  def save_multi(instances:)   storage_layer.save_multi(instances: instances);     end
  def delete(instance:)        storage_layer.delete(instance: instance);           end
  def delete_multi(instances:) storage_layer.delete_multi(instances: instances);   end
end
