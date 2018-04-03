class UpdateErrorService

  def self.perform(permitted_params, id)
    new.perform(permitted_params, id)
  end

  def perform(permitted_params, id)
    persist(permitted_params, id)
  end

  private

  def persist(permitted_params, id)
    error = Error.find_by_id(id)
    error.update_attributes permitted_params
    error
  end

end
