require_relative '../proxy'

class DAL::Proxy::ReadOnly < DAL::Proxy

  def _delete(instance)        end
  def _delete_multi(instances) end
  def _save(instance)          end
  def _save_multi(instances)   end

end
