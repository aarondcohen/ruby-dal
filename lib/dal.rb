class DAL

  ##############################
  # Helpers
  ##############################

  def instance_to_identifier
    raise "instance_to_identifier not implement by #{self.class}"
  end
  alias_method :to_id, :instance_to_identifier

  def instances_to_identifiers(*instances)
    instances.map {|i| instance_to_identifier(i) }
  end
  alias_method :to_ids, :instances_to_identifiers

  ##############################
  # Accesors
  ##############################

  def load(identifier:)
    raise "load not implement by #{self.class}"
  end

  def load_multi(identifiers:)
    raise "identifiers class #{identifiers.class} is not a collection" unless instances.responds_to? :each
    identifiers.map {|i| self.load(instance: i) }
  end

  def reload(instance:)
    load(identifier: to_id(instance))
  end

  def reload_multi(instances:)
    load_multi(identifiers: to_ids(instances))
  end

  ##############################
  # mutators
  ##############################

  def delete(instance:)
    raise "save not implement by #{self.class}"
  end

  def delete_multi(instances:)
    raise "identifiers class #{identifiers.class} is not a collection" unless instances.responds_to? :each
    instances.each {|i| delete(instance: i) }

    return
  end

  def save(instance:)
    raise "save not implement by #{self.class}"
  end

  def save_multi(instances:)
    raise "identifiers class #{identifiers.class} is not a collection" unless instances.responds_to? :each
    instances.each {|i| save(instance: i) }

    return
  end

end

#module DAL::Storage; end
