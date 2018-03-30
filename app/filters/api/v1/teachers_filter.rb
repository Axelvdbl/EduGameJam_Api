class Api::V1::TeachersFilter < Api::V1::BaseFilter
  def collection
    teachers = self.resource

    unless params[:teacher_id].blank?
      teachers = teachers.where('teachers.id = ?', params[:teacher_id])
    end

   return self.with_associations(teachers)
  end
end
