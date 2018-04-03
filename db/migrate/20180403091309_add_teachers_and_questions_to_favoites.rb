class AddTeachersAndQuestionsToFavoites < ActiveRecord::Migration[5.1]

	def change
		add_reference :favorites, :teacher, foreign_key: true
		add_reference :favorites, :message, foreign_key: true
  end

end
