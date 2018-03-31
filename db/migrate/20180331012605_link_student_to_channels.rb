class LinkStudentToChannels < ActiveRecord::Migration[5.1]

	def change
		add_reference :students, :channels, foreign_key: true
  end
	
end
