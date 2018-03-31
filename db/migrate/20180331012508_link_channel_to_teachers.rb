class LinkChannelToTeachers < ActiveRecord::Migration[5.1]

	def change
  	add_reference :channels, :teachers, foreign_key: true
	end

end
