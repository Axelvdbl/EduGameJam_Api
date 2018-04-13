class Favorite < ApplicationRecord

  belongs_to :teacher
  belongs_to :message

  def render_api
    {
       id: self.id,
       created_at: self.created_at,
       teacher_id: self.teacher_id,
       message_id: self.message_id,
    }
  end

end
