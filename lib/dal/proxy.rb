require_relative '../dal'

class DAL::Proxy < DAL

  attr_reader *%i{ proxy }

  def initialize(proxy:)
    @proxy = proxy
  end

  def to_identifier(instance)   proxy.to_identifier(instance)   end
  def to_identifiers(instances) proxy.to_identifiers(instances) end

  def _load(identifier)        proxy._load(identifier)        end
  def _load_multi(identifiers) proxy._load_multi(identifiers) end
  def _delete(instance)        proxy._delete(instance)        end
  def _delete_multi(instances) proxy._delete_multi(instances) end
  def _save(instance)          proxy._save(instance)          end
  def _save_multi(instances)   proxy._save_multi(instances)   end

end
