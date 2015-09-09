class DAL

  ##############################
  # Helpers
  ##############################

  def instance_to_identifier(instance)
    raise ::NotImplementedError, "instance_to_identifier not implemented by #{self.class}"
  end
  alias_method :to_id, :instance_to_identifier

  def instances_to_identifiers(instances)
    instances.map {|i| self.instance_to_identifier(i) }
  end
  alias_method :to_ids, :instances_to_identifiers

  ##############################
  # Accesors
  ##############################

  def load(identifier)
    raise ::NotImplementedError, "load not implemented by #{self.class}"
  end

  def load_multi(identifiers)
    raise ::TypeError, "identifiers class #{identifiers.class} is not a collection" unless instances.responds_to? :each
    identifiers.map {|i| self.load(i) }
  end

  def reload(instance)
    self.load(self.to_id(instance))
  end

  def reload_multi(instances)
    self.load_multi(self.to_ids(instances))
  end

  ##############################
  # Mutators
  ##############################

  def delete(instance)
    raise ::NotImplementedError, "delete not implemented by #{self.class}"
  end

  def delete_multi(instances)
    raise ::TypeError, "identifiers class #{identifiers.class} is not a collection" unless instances.responds_to? :each
    instances.each {|i| self.delete(i) }

    return
  end

  def save(instance)
    raise ::NotImplementedError, "save not implemented by #{self.class}"
  end

  def save_multi(instances)
    raise ::TypeError, "identifiers class #{identifiers.class} is not a collection" unless instances.responds_to? :each
    instances.each {|i| self.save(i) }

    return
  end

end

#module DAL::Storage; end
