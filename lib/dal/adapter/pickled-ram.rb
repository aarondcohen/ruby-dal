require_relative '../adapter'

class DAL::Adapter::PickledRAM < DAL::Adapter

  def initialize
    clear
  end

  def _load(identifier)
    value = @id_to_instance[identifier]
    value ? Marshal.load(value) : nil
  end

  def _save(instance)
    @id_to_instance[to_identifier(instance)] = Marshal.dump(instance)

    return
  end

  def _delete(instance)
    @id_to_instance.delete(to_identifier(instance))

    return
  end

  def clear
    @id_to_instance = {}
  end

end
