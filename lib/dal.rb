class DAL

  ##############################
  # Helpers
  ##############################

  def to_identifier(instance)
    require_implementation!(__method__)
  end

  def to_identifiers(instances)
    instances.map {|i| self.to_identifier(i) }
  end

  ##############################
  # Accesors
  ##############################

  def load(identifier)
    require_implementation!(__method__)
  end

  def load_multi(identifiers)
    validate_collection!(identifiers)
    identifiers.map {|i| self.load(i) }
  end

  def reload(instance)
    self.load(self.to_identifier(instance))
  end

  def reload_multi(instances)
    self.load_multi(self.to_identifiers(instances))
  end

  ##############################
  # Mutators
  ##############################

  def delete(instance)
    require_implementation!(__method__)
  end

  def delete_multi(instances)
    validate_collection!(instances)
    instances.each {|i| self.delete(i) }

    return
  end

  def save(instance)
    require_implementation!(__method__)
  end

  def save_multi(instances)
    validate_collection!(instances)
    instances.each {|i| self.save(i) }

    return
  end

  private

  #TODO: consider introducing new error types

  def require_implementation!(method)
    raise ::NotImplementedError, "#{method} not implemented by #{self.class}"
  end

  def validate_collection!(collection)
    unless collection.responds_to? :each
      raise ::TypeError, "Given #{collection.class} intead of a collection"
    end

  end

end

#module DAL::Storage; end
