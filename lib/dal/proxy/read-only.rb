require_relative '../proxy'

class DAL::Proxy::ReadOnly < DAL::Proxy

  def delete(instance)        end
  def delete_multi(instances) end
  def save(instance)          end
  def save_multi(instances)   end

end
