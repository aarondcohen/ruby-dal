require_relative '../adapter'

class DAL::Adapter::Null < DAL::Adapter
  def instance_to_identifier; end
  def load(identifier:); end
  def save(instance:); end
  def delete(instance:); end
end
