require_relative '../adapter'

class DAL::Adapter::RAM < DAL::Adapter

  def initialize
    clear
  end

  def load(identifier)
    @id_to_instance[identifier]
  end

  def save(instance)
    @id_to_instance[to_identifier(instance)] = instance
  end

  def delete(instance)
    @id_to_instance.delete(to_identifier(instance))
  end

  def clear
    @id_to_instance = {}
  end

end
