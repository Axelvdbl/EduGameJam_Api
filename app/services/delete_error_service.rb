class DeleteErrorService

  def self.perform id
    new.perform id
  end

  def perform id
    persist id
  end

  private

  def persist id
    error = Error.find_by_id(id)
    error.destroy
  end

end
