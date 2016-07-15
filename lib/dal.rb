class DAL

  ##############################
  # Helpers
  ##############################

  def to_identifier(instance)
    _require_implementation!(__method__)
  end

  def to_identifiers(instances)
    _validate_collection!(instances)

    instances.map {|instance| to_identifier(instance) }
  end

  def clean(instance) end
  def validate!(instance) end

  ##############################
  # Accesors
  ##############################

  def load(identifier)
    instance = _load(identifier)
    clean(instance) if instance
    instance
  end

  def load_multi(identifiers)
    _validate_collection!(identifiers)

    instances = _load_multi(identifiers)
    instances.reject(&:nil?).each { |instance| clean(instance) }
    instances
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
    _delete(instance)
    clean(instance)
  end

  def delete_multi(instances)
    _validate_collection!(instances)

    _delete_multi(instances)
    instances.each { |instance| clean(instance) }

    return
  end

  def save(instance)
    validate!(instance)
    _save(instance)
    clean(instance)
  end

  def save_multi(instances)
    _validate_collection!(instances)

    instances.each { |instance| validate!(instance) }
    _save_multi(instances)
    instances.each { |instance| clean(instance) }

    return
  end

  ##############################
  # Implementation
  ##############################

  protected

  def _delete(instance)
    _require_implementation!(__method__)
  end

  def _delete_multi(instances)
    instances.each { |instance| _delete(instance) }
  end

  def _load(identifier)
    require_implementation!(__method__)
  end

  def _load_multi(identifiers)
    identifiers.map { |identifier| _load(identifier) }
  end

  def _save(instance)
    _require_implementation!(__method__)
  end

  def _save_multi(instances)
    instances.each { |instance| _save(instance) }
  end

  ##############################
  # Helpers
  ##############################

  private

  #TODO: consider introducing new error types

  def _require_implementation!(method)
    raise ::NotImplementedError, "#{method} not implemented by #{self.class}"
  end

  def _validate_collection!(collection)
    unless collection.responds_to? :each
      raise ::TypeError, "Given #{collection.class} intead of a collection"
    end

  end

end

#module DAL::Storage; end
