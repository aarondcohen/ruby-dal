require_relative '../cache'

class DAL::Cache::Null < DAL::Cache
  def instance_to_identifier; end
  def load(identifier:); end
  def save(instance:); end
  def delete(instance:); end
end
