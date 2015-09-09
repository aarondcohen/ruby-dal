require_relative '../adapter'

class DAL::Adapter::PickledRAM < DAL::Adapter

  def initialize
    clear
  end

  def load(identifier)
    value = @id_to_instance[identifier]
    value ? Marshal.load(value) : nil
  end

  def save(instance)
    @id_to_instance[to_identifier(instance)] = Marshal.dump(instance)

    return
  end

  def delete(instance)
    @id_to_instance.delete(to_identifier(instance))

    return
  end

  def clear
    @id_to_instance = {}
  end

end
