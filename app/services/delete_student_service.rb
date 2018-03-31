class DeleteStudentService
  def self.perform id
    new.perform id
  end

  def perform id
    persist id
  end

  private

  def persist id
    student = Student.find_by_id(id)
    student.destroy
  end

end
