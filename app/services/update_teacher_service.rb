class UpdateTeacherService

  def self.perform(permitted_params, id)
    new.perform(permitted_params, id)
  end

  def perform(permitted_params, id)
    persist(permitted_params, id)
  end

  private
  def persist(permitted_params, id)
    teacher = Teacher.find_by_id(id)
    teacher.update_attributes permitted_params
    teacher
  end

end
