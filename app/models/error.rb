class Error < ApplicationRecord

	belongs_to :message

	def render_api
		{
			id: self.id,
			created_at: self.created_at,
			error: self.error,
			message_id: self.message_id
		}
	end

end
