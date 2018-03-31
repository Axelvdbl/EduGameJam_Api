class Api::V1::StudentsFilter < Api::V1::BaseFilter
  def collection
    students = self.resource

    unless params[:channels_id].blank?
      students = students.where('students.channels_id = ?', params[:channels_id])
    end

   return self.with_associations(students)
  end
end
