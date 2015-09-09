require_relative '../dal'

class DAL::Proxy < DAL

  attr_reader *%i{ proxy }

  def initialize(proxy:)
    @proxy = proxy
  end

  def instance_to_identifier(instance)   proxy.instance_to_identifier(instance)    end
  def instances_to_identifiers(instance) proxy.instances_to_identifiers(instances) end

  def load(identifier)        proxy.load(identifier)        end
  def load_multi(identifiers) proxy.load_multi(identifiers) end
  def reload(instance)        proxy.reload(instance)        end
  def reload_multi(instances) proxy.reload_multi(instances) end
  def delete(instance)        proxy.delete(instance)        end
  def delete_multi(instances) proxy.delete_multi(instances) end
  def save(instance)          proxy.save(instance)          end
  def save_multi(instances)   proxy.save_multi(instances)   end

end
