class Api::V1::TeachersController < Api::V1::BaseController

	def index
			teachers = Api::V1::TeachersFilter.new(Teacher.all, params).collection
			render :json => array_serializer(teachers)
		end

		def show
			teacher = Teacher.find_by_id(params[:id])
			render :json => teacher.render_api
		end

		def create
			teacher = CreateTeacherService.perform(permitted_params)
			return api_error(status: 422, errors: teacher.errors) unless teacher.save
			render(
	 			json: teacher,
	 			status: 201,
	 			location: api_v1_teacher_path(teacher.id)
			)
		end

		def update
			teacher = UpdateTeacherService.perform(permitted_params, params[:id])
			return api_error(status: 422, errors: teacher.errors) unless teacher.save
			render(
	  		json: teacher.render_api,
	  		status: 201,
	  		location: api_v1_teacher_path(teacher.id)
			)
		end

		def destroy
	 		teacher = DeleteTeacherService.perform(params[:id])
	 		return api_error(status: 422, errors: teacher.errors) unless teacher.destroyed?
	 		render(
				json: {},
				status:   204,
				location: api_v1_teacher_path(teacher.id)
			)
		end

		private

		def permitted_params
			params.require(:teacher).permit(
				:firstname,
				:lastname,
				:email,
				:id
			)
		end

		def array_serializer teachers
		teachers_serialized = Array.new
		teachers.each do |teacher|
				teachers_serialized.push(teacher.render_api)
			end
			teachers_serialized
		end

end
