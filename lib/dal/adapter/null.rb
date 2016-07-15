require_relative '../adapter'

class DAL::Adapter::Null < DAL::Adapter
  def instance_to_identifier; end
  def _load(identifier); end
  def _save(instance); end
  def _delete(instance); end
end
