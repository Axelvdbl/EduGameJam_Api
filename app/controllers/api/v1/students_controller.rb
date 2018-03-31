class Api::V1::StudentsController < Api::V1::BaseController

	def index
			students = Api::V1::StudentsFilter.new(Student.all, params).collection
			render :json => array_serializer(students)
		end

		def show
			student = Student.find_by_id(params[:id])
			render :json => student.render_api
		end

		def create
			student = CreateStudentService.perform(permitted_params)
			return api_error(status: 422, errors: student.errors) unless student.save
			render(
				json: student,
				status: 201,
				location: api_v1_student_path(student.id)
			)
		end

		def update
			student = UpdateStudentService.perform(permitted_params, params[:id])
			return api_error(status: 422, errors: student.errors) unless student.save
			render(
				json: student.render_api,
				status: 201,
				location: api_v1_student_path(student.id)
			)
		end

		def destroy
			student = DeleteStudentService.perform(params[:id])
			return api_error(status: 422, errors: student.errors) unless student.destroyed?
			render(
				json: {},
				status:   204,
				location: api_v1_student_path(student.id)
			)
		end

		private

		def permitted_params
			params.require(:student).permit(
				:firstname,
				:lastname,
				:channels_id,
				:id
			)
		end

		def array_serializer students
		students_serialized = Array.new
		students.each do |student|
				students_serialized.push(student.render_api)
			end
			students_serialized
		end

end
