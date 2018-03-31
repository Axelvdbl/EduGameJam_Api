class CreateStudents < ActiveRecord::Migration[5.1]

	def change
    create_table :students do |t|

			t.string :lastname
			t.string :firstname

      t.timestamps
    end
  end
	
end
