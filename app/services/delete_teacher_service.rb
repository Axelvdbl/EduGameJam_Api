class DeleteTeacherService
  def self.perform id
    new.perform id
  end

  def perform id
    persist id
  end

  private

  def persist id
    teacher = Teacher.find_by_id(id)
    teacher.destroy
  end

end
