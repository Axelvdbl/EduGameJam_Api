class UpdateStudentService

  def self.perform(permitted_params, id)
    new.perform(permitted_params, id)
  end

  def perform(permitted_params, id)
    persist(permitted_params, id)
  end

  private
  def persist(permitted_params, id)
    student = Student.find_by_id(id)
    student.update_attributes permitted_params
    student
  end

end
