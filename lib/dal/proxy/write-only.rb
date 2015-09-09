require_relative '../proxy'

class DAL::Proxy::WriteOnly < DAL::Proxy

  def load(identifier)        end
  def load_multi(identifiers) end
  def reload(instance)        end
  def reload_multi(instances) end

end
