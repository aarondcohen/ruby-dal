require_relative '../proxy'

class DAL::Proxy::WriteOnly < DAL::Proxy

  def _load(identifier)        end
  def _load_multi(identifiers) end

end
